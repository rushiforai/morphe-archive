"""Read actual API31 class flags; AD minSDK32 may call these without desugaring."""
import os
import struct
import zipfile
from pathlib import Path


def sdk_classes():
    sdk=Path(os.environ.get('ANDROID_HOME',str(Path.home()/'Library/Android/sdk')))
    jar=sdk/'platforms/android-31/android.jar'
    assert jar.is_file(),'Android SDK31 android.jar required to prove AD API32 availability'
    archive=zipfile.ZipFile(jar);cache={};available=set(archive.namelist())
    def read(typ):
        if typ in cache:return cache[typ]
        name=typ[1:-1]+'.class'
        if name not in available:return None
        data=archive.read(name);pos=8
        def number(size):
            nonlocal pos
            value=int.from_bytes(data[pos:pos+size],'big');pos+=size;return value
        cp=[None]*number(2);i=1
        while i<len(cp):
            tag=number(1)
            if tag==1:
                size=number(2);cp[i]=data[pos:pos+size].decode('utf8',errors='replace');pos+=size
            elif tag in {3,4}:pos+=4
            elif tag in {5,6}:pos+=8;i+=1
            elif tag in {7,8,16,19,20}:cp[i]=number(2)
            elif tag in {9,10,11,12,17,18}:pos+=4
            elif tag==15:pos+=3
            else:raise AssertionError('Unknown SDK class constant '+str(tag))
            i+=1
        flags=number(2);number(2);super_=number(2)
        for _ in range(number(2)):number(2)
        def members():
            nonlocal pos
            result={}
            for _ in range(number(2)):
                access,name,descriptor=number(2),cp[number(2)],cp[number(2)]
                result[name+descriptor]=access
                for _ in range(number(2)):
                    number(2);size=number(4);pos+=size
            return result
        members();methods=members()
        cache[typ]=(bool(flags&0x200),'L'+cp[cp[super_]]+';' if super_ else None,methods)
        return cache[typ]
    return read,archive
