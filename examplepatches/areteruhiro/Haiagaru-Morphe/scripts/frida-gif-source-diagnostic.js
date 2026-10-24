// Public user-specified MP4: bounded header read, then track metadata. No account data.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 diagnostic only');
    const url='https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4';
    try{
        const connection=Java.cast(Java.use('java.net.URL').$new(url).openConnection(),Java.use('java.net.HttpURLConnection'));
        connection.setConnectTimeout(8000);connection.setReadTimeout(8000);connection.setRequestProperty('Range','bytes=0-2047');
        try{
            console.log('HEADERS status='+connection.getResponseCode()+' type='+connection.getContentType()+' encoding='+connection.getContentEncoding());
            const input=connection.getInputStream(),buffer=Java.array('byte',new Array(2048).fill(0));
            try{const length=input.read(buffer),bytes=Array.from(buffer).slice(0,Math.max(0,length)).map(b=>(Number(b)+256)%256);console.log('PREFIX '+bytes.slice(0,64).map(b=>b.toString(16).padStart(2,'0')).join(''));
                const text=bytes.map(b=>String.fromCharCode(b)).join('');console.log('MP4_BOXES '+JSON.stringify(text.match(/ftyp|moov|trak|hdlr|vide|avc1|avc3|hvc1|hev1|av01|vp09|stsd|mp4v|mp4a|mdat|mvex/g)));
                function u32(p){return (bytes[p]*16777216+bytes[p+1]*65536+bytes[p+2]*256+bytes[p+3])>>>0;}
                function boxes(start,end,depth){for(let p=start;p+8<=end;){const size=u32(p),type=text.slice(p+4,p+8);if(size<8||p+size>end)break;
                    console.log('BOX '+depth+' '+type+' size='+size+(type==='tkhd'?' flags='+((bytes[p+9]<<16)|(bytes[p+10]<<8)|bytes[p+11]):'')+(type==='hdlr'?' handler='+text.slice(p+16,p+20):'')+(type==='stsd'?' entries='+u32(p+12)+' codec='+text.slice(p+20,p+24):''));
                    if(['moov','trak','mdia','minf','stbl','edts'].includes(type))boxes(p+8,p+size,depth+1);p+=size;
                }}boxes(0,bytes.length,0);
            }finally{input.close();}
        }finally{connection.disconnect();}
        const extractor=Java.use('android.media.MediaExtractor').$new();
        try{
            extractor.setDataSource.overload('java.lang.String','java.util.Map').call(extractor,url,Java.use('java.util.HashMap').$new());
            console.log('TRACKS '+extractor.getTrackCount());
            for(let i=0;i<extractor.getTrackCount();i++)console.log('FORMAT '+extractor.getTrackFormat(i));
        }finally{extractor.release();}
        const cached=Java.use('java.io.File').createTempFile('haiagaru-gif-source-','.mp4',app.getCacheDir());
        try{
            const transfer=Java.cast(Java.use('java.net.URL').$new(url).openConnection(),Java.use('java.net.HttpURLConnection'));
            transfer.setConnectTimeout(8000);transfer.setReadTimeout(8000);
            try{
                const input=transfer.getInputStream(),output=Java.use('java.io.FileOutputStream').$new(cached);
                try{
                    const block=Java.array('byte',new Array(16384).fill(0));let total=0,size;
                    while((size=input.read(block))!==-1){total+=size;if(total>2097152)throw Error('Diagnostic byte limit');output.write(block,0,size);}
                    console.log('LOCAL_BYTES '+total);
                }finally{input.close();output.close();}
            }finally{transfer.disconnect();}
            const local=Java.use('android.media.MediaExtractor').$new();
            try{
                local.setDataSource.overload('java.lang.String').call(local,String(cached.getAbsolutePath()));
                console.log('LOCAL_TRACKS '+local.getTrackCount());
                for(let i=0;i<local.getTrackCount();i++)console.log('LOCAL_FORMAT '+local.getTrackFormat(i));
            }finally{local.release();}
        }finally{cached.delete();}
    }catch(e){console.log('DIAGNOSTIC_ERROR '+e.stack);}
});
