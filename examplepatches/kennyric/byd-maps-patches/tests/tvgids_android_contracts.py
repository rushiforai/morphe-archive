"""Original TVgids7.0.16 Android/native identities; no publisher source or keys."""
import hashlib
from pathlib import Path
import re
import struct
import xml.etree.ElementTree as ET
import zipfile

from brabant_smali import canonical
from dex_declarations import DexDeclarations
from verify_dumpert import Smali, xml_digest
from brabant_effects import restore_alignment, restore_edits


def verify_android_baseline(root, apk, edits=(), *, ads=False, original_apk=None, tracking=False, consent=False):
    """Verify the retained original graphs and independently read DEX register ABI."""
    source = Smali(Path(root))
    declarations = DexDeclarations.from_apk(apk)
    with zipfile.ZipFile(apk) as archive:
        dex = {name: archive.read(name) for name in archive.namelist() if name.endswith('.dex')}
        libraries = {name: hashlib.sha256(archive.read(name)).hexdigest() for name in archive.namelist()
                     if name.startswith('lib/') and name.endswith('.so')}
        if ads:
            from tvgids_native_contracts import verify_ad_output
            assert original_apk is not None, 'Missing trusted original for native ownership check'
            assert set(libraries) == set(NATIVE_LIBRARIES), 'Native library set changed'
            with zipfile.ZipFile(original_apk) as original:
                for name, digest in NATIVE_LIBRARIES.items():
                    if name.endswith('/libapp.so'):
                        verify_ad_output(name.split('/')[1], original.read(name), archive.read(name), digest,
                                         tracking=tracking, consent=consent)
                    else:
                        assert libraries[name] == digest, f'Unowned native library changed: {name}'
        else:
            assert libraries == NATIVE_LIBRARIES, 'Original native library set changed'
        for owner, signature, flags, registers, count, digest in CONTRACTS:
            cls = declarations.classes[owner]
            method = cls.methods[signature]
            actual_registers, = struct.unpack_from('<H', dex[cls.dex_name], method.code_offset)
            body = source.body(owner, signature)
            parameters = re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', signature.split('(', 1)[1].split(')', 1)[0])
            local = re.search(r'\.locals (\d+)', body)
            if local:
                decoded_registers = int(local[1])+sum(2 if p in ('J', 'D') else 1 for p in parameters)+(0 if flags & 8 else 1)
            else:
                decoded_registers = int(re.search(r'\.registers (\d+)', body)[1])
            graph = canonical(body)
            owned = [edit for edit in edits if (edit['owner'], edit['signature']) == (owner, signature)]
            if owned:
                assert local, 'Owned edit unexpectedly changed register declaration form'
                graph = restore_alignment(restore_edits(graph, owned, int(local[1])), count)
            assert method.access_flags == flags and actual_registers == decoded_registers == registers, f'Original method ABI changed: {owner}->{signature}'
            assert len(graph.code) == count and graph.digest() == digest, f'Original method graph changed: {owner}->{signature}'
    manifest = ET.parse(Path(root)/'AndroidManifest.xml').getroot()
    if ads:
        from tvgids_ad_resources import restore_ad_resources
        restore_ad_resources(manifest)
    if tracking:
        from tvgids_sentry_edits import restore_sentry_resources
        restore_sentry_resources(manifest)
        from tvgids_facebook_edits import restore_facebook_resources
        restore_facebook_resources(manifest)
        from tvgids_firebase_edits import restore_firebase_resources
        restore_firebase_resources(manifest)
    assert xml_digest(manifest) == MANIFEST_DIGEST, 'Manifest changed outside owned effects'
    print(f'PASS TVgids Android: {len(CONTRACTS)} restored method graphs/ABIs, manifest and 24 native libraries')

MANIFEST_DIGEST = '87c4966fcfa7e35f7d127d5bc4e6e2c1aa45aa1a5f16471d710a1afcac008d3e'
NATIVE_LIBRARIES = {'lib/arm64-v8a/libandroidx.graphics.path.so': '41e9a793c43a0f4fddb19e33f346bace464f30f888ba7b9eaf96294ea115bfb6', 'lib/arm64-v8a/libapp.so': '5b9e587b8b5a23d20ae8178fe0eb8918eccf8b016a8ac12fbf518e80003ad402', 'lib/arm64-v8a/libcomScore.so': '2c6ab308b9f9c4e67ec9323263529bf22a37cbf23c5c7fad5671af3e312730ce', 'lib/arm64-v8a/libdartjni.so': '27af08f59b75a526e26e7cfb710e35861a9beb52f94e542a37efc53447b1e75f', 'lib/arm64-v8a/libdatastore_shared_counter.so': 'd3e48717c9aa147e0ab21063ba0e8e0211cabf8bf40b222640829519edbf58e1', 'lib/arm64-v8a/libflutter.so': '740720ba038a82de5f622d0a056ee320766eabe5c14c195bc0456e25f5b42d85', 'lib/arm64-v8a/libsentry-android.so': 'beffbf33291900eb105a572b9bb278073707c0409e5dbd9a26daaa4479ec4b80', 'lib/arm64-v8a/libsentry.so': 'c8234250ab19f9a5b0121d38367db84e675db3f156f61e17b7ca232dff35c198', 'lib/armeabi-v7a/libandroidx.graphics.path.so': '41399eba6fc2a60f6f14642375c1824f3cf25eb8fec7397d753730a3ceda3e2b', 'lib/armeabi-v7a/libapp.so': '3b50a69edb9aad8053c71ea98ee70a5d0f51c14fe431dd1add05b2064dc205ce', 'lib/armeabi-v7a/libcomScore.so': '0cccbf206d852ab08165c194703b9451318708ae372eb41915fcb29d3b45979d', 'lib/armeabi-v7a/libdartjni.so': '01e5e5d196e28469fcf0802c4e23d8d25f1ec3535092acc4f0f0e213d5cf5f35', 'lib/armeabi-v7a/libdatastore_shared_counter.so': '716c5d8d2cac8ca0edf65da8f139c7886b726ac79d542a14edeb94994ba6d3dc', 'lib/armeabi-v7a/libflutter.so': 'c1a0903911255444efc4106f500637d62b6653ed43df8e521cef61ba229c4086', 'lib/armeabi-v7a/libsentry-android.so': 'e577cb171538a70c5bf7d6800f813107bd9b6c8f94bba16eda516f394bafbda6', 'lib/armeabi-v7a/libsentry.so': '12fb17c1fcbacef9d9fe42b0d211bcb43bbc732fc929f3dd2bebbccafcbe48c2', 'lib/x86_64/libandroidx.graphics.path.so': '4e56c996f13670e70082658de7880c4020eabf4f25e43387f88ed78a713fc9f0', 'lib/x86_64/libapp.so': '606abe26e33bfcf6febdcbf2854945165eb7697ab2ed6d701b675b60e93060b6', 'lib/x86_64/libcomScore.so': '04b42d65ab1f5417616c24904cd14b798603cacaca7bf35d3c64da809762a9a0', 'lib/x86_64/libdartjni.so': '9f49af7f553dc37dfa183f9089c013282e11d440e4226c963c90d583d03b4ffb', 'lib/x86_64/libdatastore_shared_counter.so': 'fb6c9208988c49ae94943bc3236fa763ba584722e044fa4ea9a12d2941027105', 'lib/x86_64/libflutter.so': 'd6313b92f975ea51684d6690921a316c49f2c1c12f35913b19bde98fd0ed0425', 'lib/x86_64/libsentry-android.so': 'c7f8459a1aa8a7607217b01974fb86f4af47f257f494621c6c3092aaad390029', 'lib/x86_64/libsentry.so': '458819d2f4c53b48f0294172fad94fbf447b56ddc7dd26e534ef980196b18ed1'}
CONTRACTS = [
    ('Lnl/tvgids/MainActivity;', '<init>()V', 65537, 1, 2, '14e6454d525c18defb192477ef32547a1500ac4ab49bae0b512869300db378a3'),
    ('Lnl/tvgids/MainActivity;', 'c(Lrt1;)V', 17, 8, 49, 'cf2170c16e118aefaa8e9ff33643c2b08debbbaa6babfce30fc832a4df286efb'),
    ('Lnl/tvgids/MainActivity;', 'n(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lh9;)Landroid/widget/LinearLayout;', 17, 12, 54, '7de41657fb158aebbdc6dec0f2d816d681f7c1c699fdef0c213334f7f7ed835b'),
    ('Lnl/tvgids/MainActivity;', 'onCreate(Landroid/os/Bundle;)V', 17, 6, 55, '45037e48833ccec242f8edc287731f7941ad44cdf22e352dfce1c62faefd604b'),
    ('Lwa;', '<init>(Landroid/content/Context;ILorg/json/JSONObject;Li20;Lnl/tvgids/MainActivity;)V', 65537, 9, 129, 'ceac1e191c6b73b8e2199a05899efaba06768f1468ec3ccc5a1a1c5b8a41a289'),
    ('Lwa;', 'a(Lg9;)V', 17, 8, 99, '4e38a1d093202e1b74332a600d0eda0cca75a0ea152eabba5d612dec7cc6f1da'),
    ('Lwa;', 'dispose()V', 17, 3, 12, '8cad934abb5d1c4c869d9314500ea07718042a6a253f4570fa7189565758484c'),
    ('Lwa;', 'getView()Landroid/view/View;', 17, 1, 2, 'e38f722e8589ca8668163ffbac447247772c3328cdd1aac7c10a69edef9f01e2'),
    ('Lwa;', 'onMethodCall(Lin3;Lln3;)V', 17, 7, 54, '962dd1f281aadb804ab171b44d72262e6f24717fb8512e03b4868e96fdf4ccca'),
    ('Lxa;', '<init>(Lkt8;Lnl/tvgids/MainActivity;)V', 65537, 4, 6, 'a7d38a17b6e507ef73a704a65abdb05323f307372e764b5d37df186731df5ad9'),
    ('Lxa;', 'create(Landroid/content/Context;ILjava/lang/Object;)Ldd4;', 17, 12, 21, 'd77d334e3734551c577deb7720fd741e49d5093247d201f24ff1f6cb38c10904'),
    ('Lua;', '<init>(ILjava/lang/Object;Ljava/lang/Object;)V', 69633, 4, 5, 'b1463d078a265cc3b3a709edfd527d103f636805b6265e144810405ce54e06ae'),
    ('Lua;', '<init>(Ljava/lang/String;Ljava/lang/Object;I)V', 69633, 4, 5, '1fa2d6d34b6a6ef8eb0a953908d03fecc6f16148702f8ecce36b956df844e7e4'),
    ('Lua;', 'run()V', 17, 25, 665, '8ca90a8d3ee7939102de071da1dc5fbfa289493ca9c440778579702e5988f8e4'),
    ('Lda;', '<init>(ILjava/lang/Object;Ljava/lang/Object;)V', 69633, 4, 5, 'f6668fbb79037139196c83f6657ce85bc52b689d8d23bf51bd735f48bce3fb3f'),
    ('Lda;', 'a(Landroid/os/Bundle;)V', 1, 9, 115, 'b20041cb1bfd67335d665789ea4b798f7c405a808ae4f999127cdcebd88bf7e2'),
    ('Lda;', 'accept(Lio/sentry/ITransaction;)V', 1, 3, 6, 'a0f041f1f013c2799e95feaf99352d32644b357dfbc9f43a6501617dff21cc6c'),
    ('Lda;', 'apply(Ljava/lang/Object;)Ljava/lang/Object;', 1, 14, 157, 'a5e97317df9a69a7593fe1aabf7f35d297b96ad71b5c5ac90f7a503538b1fb6a'),
    ('Lda;', 'b(Ljava/io/File;)V', 1, 3, 11, '7a9ac82c5ad43c72a40083e98c26c97c106fac230b6991ddbaa0c49113d81ab3'),
    ('Lda;', 'c()Z', 1, 8, 21, '0179c86f802d138d87391434d75f33bc21e698087009d3cb94369a73b7b5e916'),
    ('Lda;', 'd(Li03;)Ljava/lang/Object;', 1, 3, 19, '332dd5a4c679f0ceb3b0913af1b6f3e1a961a7f7d2f43e6d164d724fdb35b81b'),
    ('Lda;', 'e(Lorg/prebid/mobile/ResultCode;)V', 1, 9, 66, 'a09cd8e08770112c06bdf6a256dedd9ce979d1da218478f867d1d5df1e9ee443'),
    ('Lda;', 'execute()Ljava/lang/Object;', 1, 8, 53, '714e5b7469f9243b2604919fb7e5c0422a826470203b1fd4b43c719358ce6a7e'),
    ('Lda;', 'f(Lf15;)Ljava/lang/Object;', 1, 5, 81, '389bc5e987bf5ef46ab7307df1a21342a197d9e43530368e02bd6a3c6b4f70ad'),
    ('Lda;', 'g()V', 1, 7, 60, 'e24b7a04a558d3eebc677ecd1ecc5b670d9e0839593ef5e642e9ea8a4cddb6a4'),
    ('Lda;', 'onComplete(Liq5;)V', 1, 2, 6, 'e067bd0976aa617c89076fa99349b713e974afb1bff1c1f97b6da2b492e18b4d'),
    ('Lda;', 'onFailure(Ljava/lang/Exception;)V', 1, 13, 142, '54fde8ba1bbfc289b43316e95596af4b1744e24ddb732dc3201ebe81b71335fc'),
    ('Lda;', 'onMethodCall(Lin3;Lln3;)V', 1, 27, 821, '224380df6e76caa07bfd9d70fc1d22c17fba6af4eba0561082b9eac32c33d017'),
    ('Lda;', 'run(Lio/sentry/IScope;)V', 1, 4, 12, '7308302767d54a4bff4b703b3464d191b290ca65a8fdd41164a7fd1ee15d00e5'),
    ('Lda;', 'then(Liq5;)Ljava/lang/Object;', 1, 9, 122, 'e8e390288ba225768f1d2cc5ef06234059caf69e76cc6aa4b1a0cd3cdfc9cabf'),
    ('Ljz3;', '<init>()V', 65537, 4, 31, '959d44972ec20cf739fdb49a50076e36a213d8be3298f662924de3b28db76713'),
    ('Ljz3;', 'a()V', 17, 4, 23, '236c67c2e2d2b6c8ab720131b3614c9daa8abe26bd14639343b8b26db8809e33'),
    ('Ljz3;', 'b(Ljava/lang/String;)V', 17, 36, 398, 'b140ce457b1d9ca69be9006af96beea522e7242d5eada7123ee7b4f8c0c065c1'),
    ('Ljz3;', 'd()Ljava/lang/String;', 17, 4, 22, 'f97340c8241fae4434d8e9c8c478e3e54c2fb78a461724ea7b6a4bb18ae7a10a'),
    ('Ljz3;', 'e()[Ljava/lang/String;', 17, 3, 15, '91b64cbef6f925cd51542c52100e7c11e44f887fc4ab59ae9607fc87e3045ba5'),
    ('Ljz3;', 'f(Ljava/util/ArrayList;)Lhz3;', 17, 5, 37, 'f8e4a152006aded68f5631128ad59d8ea310ee7c525cc5afc7b8108a709cf7ef'),
    ('Ljz3;', 'finalize()V', 17, 1, 7, '5e1b860a1176c4b3fd27d002ff455a2560e4043b0c6e0b3ae26ba546b6eb7b89'),
    ('Ljz3;', 'g(ILjava/util/Map;)V', 17, 15, 102, '8ed9f85a70eeab3059426b352a2a5ace56b1b81285405c6c7bac989ee23f067a'),
    ('Ljz3;', 'h(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V', 17, 5, 16, 'e8886694c4aa66e33316b5eb7ea111a72a0501b5413e85191a1ddd1ff0ce4962'),
    ('Ljz3;', 'i(ILjava/util/Map;)V', 17, 4, 8, 'd77e320cd29a221acf04eba790f0fcf93f3dfc423c672ac9712407fa788aeb8b'),
    ('Ljz3;', 'j(Ljava/lang/String;)V', 17, 9, 60, '2b3b4ca38363195489e7e561fadf786a20d7097882ad51ae1f5c7beff4b85bc3'),
    ('Ljz3;', 'k()V', 17, 12, 95, 'b11bf468242975c3defa2da804a4c35001bb7506b3f5f5717e3950568ea9d7e1'),
    ('Ljz3;', 'onPause(Lwb3;)V', 17, 3, 21, '39b6199e8ef780be2805ee0f232fef90bb51c3fd792ddcfad359686a1671c511'),
    ('Ljz3;', 'onResume(Lwb3;)V', 17, 4, 16, '0c60d5bfafbb118f22b5de0dbf9274d59620de0ae7f989a332def508b3471459'),
    ('Ljz3;', 'postMessage(Ljava/lang/String;)V', 1, 2, 2, 'd36ce262d8155bb57d9c2c8fd5374a035a03041f6c096fb4638cb666c19d2a6a'),
    ('Lxs8;', '<clinit>()V', 65544, 1, 4, '37f953f349934a268f0098037d97b0725babc58899517db1ec95ea7936f659a0'),
    ('Lxs8;', '<init>(Landroid/content/Context;I)V', 65537, 10, 94, '7b4489c164844c14534595458bd7f6c9badededacf3c0fbf25af2923cecdde2e'),
    ('Lxs8;', '<init>(Landroid/content/Context;ILrs8;Z)V', 65537, 6, 15, '993f1c83c5452d98814b26e8163c7e68500ff59e69dc01a3b45dbbf1cbaed5a3'),
    ('Lxs8;', '<init>(Lis9;Ljr9;Lur9;Ljava/io/IOException;Z)V', 69633, 6, 7, '4fbd28015f3ef7081b28bd61ee7b5f1f84d64627fd926b1bb9a971be77bc04eb'),
    ('Lxs8;', '<init>(ZLv94;Ljava/util/List;Ljava/util/List;)V', 65537, 5, 12, 'cc454285a5cdc0ff68b768f5783a693df7e030eeac60458deef6c485bf00e6c5'),
    ('Lxs8;', 'n(Lbr8;Ldr8;Ler8;Ler8;Z)Lxs8;', 9, 9, 28, 'b04312b04c9a0bb18f52d3b3e29f88de123dd2e0dd4c2852dd1c56ed6e91c84d'),
    ('Lxs8;', 'r(Lm97;)Ljava/lang/String;', 9, 5, 50, '2b3a82fd700b20e5fd023a4afdb4fdeaaf08dd08cd5a2ea71082337ccfd8d62b'),
    ('Lxs8;', 'a()I', 1, 1, 6, 'ebfc3ea99fdb141cb8774ff825fc2d999856e711d221e0695c1df43c7844c566'),
    ('Lxs8;', 'b(Landroid/view/View;Lh9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;ZLz5;)V', 1, 12, 62, 'e31fc79d974fb656e0cc9c654f8592f8cf5ccef85bad7b2060f7547aa35933cc'),
    ('Lxs8;', 'd(Landroid/view/View;)V', 1, 2, 5, 'ce2ce3a0b7ffab96bd80458cdf2489804dffb0b189f8f6cf030f3374bf454905'),
    ('Lxs8;', 'e()I', 1, 1, 6, '279ef68f91795be387fdef4e9391a2826d4cc3bf940ad7ecddca804c93dd180c'),
    ('Lxs8;', 'f()V', 131073, 3, 25, '3014c9df425104fc1ff750b59835e87e4c2be27d0ce8bc3e30e21ce7013878cf'),
    ('Lxs8;', 'g()Z', 131073, 3, 29, 'b43d1fefc3c93bd89694c60dcf080b2dcfab211849da876395207df7db3a5082'),
    ('Lxs8;', 'h(Lxl4;Landroidx/compose/ui/platform/AndroidComposeView;Z)I', 1, 22, 121, '4828fa8537241aa57d5f10a1883f96d563e4f232aa25ffe63a3621eebca6fb18'),
    ('Lxs8;', 'i()V', 1, 4, 59, '5fa9ba3a9640a33c791f31fa30a505acd4c778a7efbac57a66f436f325cb8ffb'),
    ('Lxs8;', 'j()Ljava/lang/Boolean;', 1, 6, 41, '8b11c16fef22a8ce2f460ddbff01bc5ff1d11a7349a647d62189bb9641398b8b'),
    ('Lxs8;', 'k(Ljava/lang/String;Ljava/lang/String;)V', 1, 14, 86, '6966f40e1c8c65c9df5ac101751ac4442b3fe06da53824b783e6e250f3e64d62'),
    ('Lxs8;', 'l()V', 131073, 3, 26, 'c9caeee4b19067fd57dea83a22e2eb2e8bc5320762203a7f5e954f3bb0a6983e'),
    ('Lxs8;', 'm(II)V', 1, 5, 26, '89f79424cf79ebf01498fcd964ed081a8fd0e668086de7f6bf29e6e04e2b0921'),
    ('Lxs8;', 'o(Lm97;)Z', 1, 8, 53, '6d72fb2a6a8584df8be52b29a55a84972f24a9563edbfd42149047b28a0b4798'),
    ('Lxs8;', 'p(Lm97;Lw77;)Z', 1, 17, 205, 'ae466fe2a08ce1f9e9b10ec6fb7d83428a091cc056389a359f79d1677515c417'),
    ('Lxs8;', 'q(Ljava/lang/String;)Ljava/io/File;', 1, 5, 13, 'b9d9ce18617bb0e8ef656814d4d509e209031392a83b2f455b4e149b06910442'),
    ('Lxs8;', 's(IJ)V', 1, 4, 4, '52f639f4f48842d888296ee42516c63c5e27e7f159978cda0a7230651f6e4f49'),
    ('Lxs8;', 't(I)Lo97;', 1, 7, 49, '8e4887f83325f0c013ec5da5c497d96e7ccb458ba7f99a7e27a80626f1203fcf'),
    ('Lxs8;', 'zza(Ljava/lang/Object;)Ljava/lang/Object;', 1, 12, 154, 'd09bd11889525fbc40724029fde5d7cbb34851825543cb170ba3c3b4301a3063'),
    ('Lxs8;', 'zza(Ljava/lang/Object;)V', 1, 10, 20, 'b54e7da50b97716eb8ddfcb7c860ad0089b2028af069db60fb8233a69cf46005'),
    ('Lyn8;', '<clinit>()V', 69640, 4, 17, '91399c477aab7a74109f86825a7a037c5fb17ac07150eb742b805c94653f91d9'),
    ('Lyn8;', '<init>(I)V', 65537, 5, 28, '17475a6c66c3c7e9330bcf62807add9c2976ea2cd98b6bd17c380306aa81db36'),
    ('Lyn8;', '<init>(IZ)V', 69633, 3, 3, '08bd4f109f9ab7f52e8c281f26515ce5c64aec336fce87b193b57a7cd749a291'),
    ('Lyn8;', '<init>(Landroid/content/Context;)V', 65537, 3, 13, '1324239fd06c175bfa9020414ea041cb01f07ae586f7344cdf97c7b1d6d51ef1'),
    ('Lyn8;', '<init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzcy;)V', 65537, 4, 9, '1c8dded8c885ffea3e0ec50f506f1f8a77b918af1c76e7a156483378c4365232'),
    ('Lyn8;', '<init>(Landroid/content/Context;Lio0;)V', 65537, 4, 6, '9d58007b848dce5b84f15d41e0de33332ffb1e4449c3a52423546aa44c21206c'),
    ('Lyn8;', '<init>(Landroid/view/View;)V', 65537, 4, 15, '1e0b39ef776d36591d17ebcacd1b4a945a3551060928bb46a42673b54b0f29a7'),
    ('Lyn8;', '<init>(Lg62;)V', 65537, 3, 12, '1806ab8c945469d7d7aa6d0e082c66b2dd1494957e94d113895f85329e697f33'),
    ('Lyn8;', '<init>(Lhw1;Landroid/content/SharedPreferences;Lli9;)V', 65537, 5, 7, 'b294daf4ec476f0d29fbdea37d7a2445c0b8d1a422179b16f01fb7995de391c0'),
    ('Lyn8;', '<init>(Ljava/lang/Object;I)V', 69633, 3, 4, 'a3ccda0bd683e6573a8cec20e5526f8aa3f14af057fba13b3a9c1638858bd91c'),
    ('Lyn8;', '<init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V', 69633, 5, 6, '9094a7474e65f3c804916b88a67444e4c17334e2ed9facc7c4aeb1bd4d7a44c0'),
    ('Lyn8;', '<init>(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 65537, 7, 7, 'c54df10fed6eda5fd4883b75970dda92384bb897b8e1cb9df65fc3b71f5e2abc'),
    ('Lyn8;', '<init>(Lly5;Lu60;Lu01;Ljava/util/Set;)V', 65537, 12, 34, '7d1660651a93426009b44f070cc7e850c207874bfd395683ba3117a430ab3cb7'),
    ('Lyn8;', '<init>(Lnl/tvgids/MainActivity;Lkt8;Lrx4;)V', 65537, 6, 23, '12e220d85694c9247a87860113a076171fdbc3d6fcf5194cdfd8aa8682db5b50'),
    ('Lyn8;', '<init>(Lnw2;)V', 65537, 3, 9, 'c5828599224cdaf0e1214271c118f6bbf086c8669ea80e1ec4f8805bb8d9449c'),
    ('Lyn8;', '<init>(Lo20;)V', 65537, 4, 12, '40adf77a8b0f1d0f71889acf9eee8e27f81a005d8a3393ea895a0e609f95dc21'),
    ('Lyn8;', '<init>(Lob0;)V', 65537, 3, 9, 'f4968ac99bcf3cd4510b486267b79d758715a83a6e7f161adcdcae7767f3e185'),
    ('Lyn8;', '<init>(Lor7;)V', 65537, 4, 17, '87a8c83d1c7e133d6e3d3092b4d500313cd6f9df6caa754f81b5f1b134fdd67a'),
    ('Lyn8;', '<init>(Lzw0;Lio/flutter/embedding/engine/FlutterJNI;)V', 65537, 11, 17, 'b769f88c1e709c443885af5f9620de5bfacf21b8fc051d6110115e558b5590f6'),
    ('Lyn8;', 'H(Lio0;Lpj1;)Lorg/json/JSONObject;', 9, 11, 50, '54a428a3a38324fcd96810d0b1d866aa13d571c90684ca31330ec93e5cc26725'),
    ('Lyn8;', 'M(ILjava/lang/String;)Ljava/lang/Boolean;', 9, 7, 155, '3380239ef0adf0e1fb233ff4ef2d94d3281e8e9a711d2681d6c65195ef492394'),
    ('Lyn8;', 'Y(Landroid/content/Context;)Lyn8;', 9, 8, 61, '4da464bf3858dc4689ccc51cc295b5ff46a920b90323ede0b826914ba2c2e571'),
    ('Lyn8;', 'j(Landroid/text/Editable;Landroid/view/KeyEvent;Z)Z', 9, 9, 43, 'da32e495986428acd2942dfb59cfc3f8d30e44482ad5b4d89ccc7bbcfe3460c2'),
    ('Lyn8;', 'x(Landroid/content/Context;)Lyn8;', 9, 3, 18, 'f4b1b41f012af77cc418fecb223e69c3840ddc49f28debc91b340e69d97192b5'),
    ('Lyn8;', 'A()Lz64;', 1, 1, 8, '071c6da8f6255c8c73406d6350733ee42da4cfaa04111cef3d2b47d2fab93202'),
    ('Lyn8;', 'B()I', 1, 3, 30, '33023c67b8a3d8fa65b1aa2743268b6b3abceb189fb37685400688750bd762e3'),
    ('Lyn8;', 'C()I', 1, 3, 26, 'edcbacbdd0dfba2c3e779ce310f79afe0cc7a43f0079392c8ea9f71d38718f51'),
    ('Lyn8;', 'D()Ljava/lang/String;', 1, 4, 38, 'b7b8a2a3b94f6c5341381783d4ebdaf9d688dba82e77fcc757e39696371debdc'),
    ('Lyn8;', 'E(Ljava/lang/String;)Lorg/json/JSONObject;', 1, 6, 56, '5c2cf4dc06112a1fe2069f44a3c93f293a1a2d8a04666b178cd98abf89451d8d'),
    ('Lyn8;', 'F(I)Ljava/util/List;', 1, 2, 12, '31cd2c624d3404ad6dcc54343f00507bf11bb38aba9c7f0fcb9a78a3b139fad5'),
    ('Lyn8;', 'G()J', 1, 3, 5, '123de7b0cc03dd73f7774a62dbe8f9be1a738b2090de6edb4af27595fb46672b'),
    ('Lyn8;', 'I()I', 1, 1, 8, 'ff004aaf666175db4404ee3a8a9dcc2a1a69e84e96fe043001a6eda3a946d378'),
    ('Lyn8;', 'J(I)Landroid/view/View;', 1, 2, 7, '5c8738373d7aa5bc6e9b560658df01bb218192c32ffa388bc174f829500d1822'),
    ('Lyn8;', 'K()I', 1, 1, 7, 'fd001b450b0822744debcd80fffbcd34e5af5175dc7828a3e1e65627dd9d19e6'),
    ('Lyn8;', 'L(Ljava/lang/CharSequence;IILw36;)Z', 1, 11, 54, 'f1740e45347198934ca54e157b35c745143c9cd86f5074f6414f462714856dbf'),
    ('Lyn8;', 'N(Loo1;Ljava/util/EnumMap;Ljava/util/function/Function;)Ljava/lang/Integer;', 1, 5, 19, '9fa29ce4f3ef7af503293ca28a3a5d02750abb53ff27153679cb781910272ca3'),
    ('Lyn8;', 'O(Ljava/lang/CharSequence;IIIZLpf1;)Ljava/lang/Object;', 1, 23, 137, '2cdb270500e68627dd1b4c6dd271ca808fa16d22890ccdfcf4376ed63805bf2d'),
    ('Lyn8;', 'P(I)Z', 1, 10, 60, 'dc2099c064ed23aaddb6956a4a6dce2954b91b9a1f494006b316bf63a6e86410'),
    ('Lyn8;', 'Q(Lny;IZ)V', 1, 21, 174, '335009f74b28762caf7ba80434ecfe73f7a8745f27b99ca92d16b9cf4f6e5bd5'),
    ('Lyn8;', 'R(Ljava/lang/String;)V', 1, 2, 6, '66dbb7ba353ef4e58798d75c4202a296d231d0b9f78a170b5c814029b0226f3a'),
    ('Lyn8;', 'S(Lmb0;)V', 1, 2, 5, '33000d515359e57f35266252ebc88f1cdcbe435aad68307b94ba840db473c577'),
    ('Lyn8;', 'T(Lw31;)V', 1, 2, 5, 'a0fe25964706104e4a957f03aa19aaf12c9034d908447a5c46e7f7a8b89d4c73'),
    ('Lyn8;', 'U(Lb53;)V', 1, 2, 5, '5a42addc7074739b52ad87f0b3ee78fd10fa4e241293cb7829076f35694999cc'),
    ('Lyn8;', 'V(J)V', 1, 3, 5, 'ac4919611373c4a67f56661486d86467f0837d22518bfe061b7e2fc3c6266300'),
    ('Lyn8;', 'W(JLrx4;)V', 1, 12, 23, 'fca3243423ccbbda5f48c2e3672d104f5570e3d908e21976cc3f3e3928172b4f'),
    ('Lyn8;', 'X(Lnw2;Lkotlinx/serialization/KSerializer;)V', 1, 4, 8, '879d133eff46f7dbc25a963d28d0d033e7b9319bff097f4c88ebf868ceb91705'),
    ('Lyn8;', 'Z(Lem7;)V', 1, 5, 42, '7537576c2050bc0c86972d7083be822be57000e04ac6a0f603f5fee42c24f061'),
    ('Lyn8;', 'a()Ljb;', 1, 5, 83, '0f2fe08b65e4fb77b7c27ea7aeb2708e17709012a10a04d1d42fb3dded567a1d'),
    ('Lyn8;', 'b()Lrc;', 1, 5, 80, 'c65c02cba4444253f65ad4a724f8a8990baa668eea63b3584589a8861ee556bc'),
    ('Lyn8;', 'c(Ljava/lang/Exception;)V', 1, 2, 4, '5074818710efe994ab249a0f9d1dbba568e28c4ca1a08bd8920d7dc79c15de05'),
    ('Lyn8;', 'd()Lqd;', 1, 5, 80, 'dbe3c4486ae065b3bc74166111431901170b447078477b82acbace35d7b9134f'),
    ('Lyn8;', 'e()Leg5;', 1, 1, 3, '46a035cb50b7ab52755c3663eacbabdfea3210697850ddfccba4ca015c93fe54'),
    ('Lyn8;', 'f()Lny;', 1, 4, 30, 'f72985590bda79d09b997dcd041af0683ee7f8c1ba748f76f0f9135e64957250'),
    ('Lyn8;', 'g()Lnb2;', 1, 5, 83, '36f4307b856279ebd249468bf0e34c2b499bde42fe7dedecad795c57339c7f74'),
    ('Lyn8;', 'h(Lmi0;)V', 1, 6, 41, '268c83e228eefdd404e20e138a42b04638afbbbe8089cb50585190342f283e13'),
    ('Lyn8;', 'i(Lc22;)V', 1, 3, 16, 'e743676d4eff77cbbf5705399f5a1775d00dae91176d307fc41c5c70e47e33cc'),
    ('Lyn8;', 'k(Landroid/os/Bundle;)V', 1, 8, 49, '3af4bc1675b45d4ca143cfc6b1dbb7db4ed43e402a46b7d5f7107f7f2687ae6f'),
    ('Lyn8;', 'l(ILb3;)V', 1, 3, 4, 'a22feb30b1efaab3f8109690ae5ce164f70483a7df486a8339311dc4af4f24a2'),
    ('Lyn8;', 'm(ILb3;Ljava/io/Serializable;)V', 1, 4, 4, 'f826891227865267e0f037ecb2be0593d174c0cf456cb87c0c7fc9596c21ea6c'),
    ('Lyn8;', 'n(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;', 1, 8, 72, '949b169afcf60e4ac07c81ad1836b5d071c9fc38242c78bd3a23679ed6c27ea6'),
    ('Lyn8;', 'o(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V', 1, 11, 56, '92338065b48e0a7a588165b170295e1864eaa7b66644998ba75c84a346a219fc'),
    ('Lyn8;', 'onFailure(Ljava/lang/Throwable;)V', 1, 3, 7, '5db5a6cbb119751d87977895d5dd7fd256afd83fed331c1a9dca5b55f818223e'),
    ('Lyn8;', 'onMethodCall(Lin3;Lln3;)V', 1, 6, 41, '394f3eeac7c0541a70e62266f392aef44f16a5d30ef4e3d89524a9365a137367'),
    ('Lyn8;', 'onSuccess(Ljava/lang/Object;)V', 1, 3, 11, '250eb14b3a5810db258f6d40d276784527ba23892bdf98c51f5a507a32e49ac9'),
    ('Lyn8;', 'onSuccess(Lnl/pinch/optoutadvertising/sdk/model/AdResponse;)V', 1, 11, 27, 'c1f94460f3a284b5baea5e21de36ec6d3363867e55d3da6cdb6eec65be636ba3'),
    ('Lyn8;', 'p()Lmb0;', 1, 1, 5, 'e3d749f9672ea9886409822a3a0649662aa900ddefc202201b9ba5ae16e8877f'),
    ('Lyn8;', 'q(I)Landroid/view/View;', 1, 6, 32, '79c4b8a44fe2413884139f3740c84a351127303bfbe26053ddbe98786c8008d9'),
    ('Lyn8;', 'r()I', 1, 2, 12, '1c504351f0a94744202bbeb18fd7ccffbb877485f49249afcef5478fefbe2644'),
    ('Lyn8;', 's()Lif3;', 1, 8, 36, '032b786c849a154d7f9cb2ca9255e11031804a7dbadd69831bf857e162a51d4c'),
    ('Lyn8;', 't(Lpj1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;', 1, 15, 111, '372a132d41b899a5e36a59716372cb03b5e7c321036032bd9bf5cd89a1e182fc'),
    ('Lyn8;', 'toString()Ljava/lang/String;', 1, 3, 42, 'ec392c0c85b121bc994504c90c7f7bb3a4adc352a5ed6f237787184205822e6c'),
    ('Lyn8;', 'u()I', 1, 5, 27, '71f4d46644a4cbff4b63a46f1fe4cf838154807d2f943c41114a1a9f0a407b3b'),
    ('Lyn8;', 'v()Lrd5;', 1, 1, 3, '6837857352e0210a7eaed8953481926dd69e346e6b3366f144597f1095cece07'),
    ('Lyn8;', 'w()Z', 1, 1, 7, '0d357324f7a66a81772a3906c90043e99968eedee6ff7d134fd8a2f49a271b48'),
    ('Lyn8;', 'y()Ltz2;', 1, 1, 8, 'c41aba264b99fcb0749ed4613e7b9add8dfc0967c2da6193c6727a565e3d9632'),
    ('Lyn8;', 'z()I', 1, 7, 31, '1d5ec43c423d39a60f83bad0e085575fb6bec218785b76a683ff5b3b68689c20'),
]

from tvgids_osb_contracts import OSB_CONTRACTS
CONTRACTS += [row for row in OSB_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]

from tvgids_comscore_contracts import COMSCORE_CONTRACTS
CONTRACTS += [row for row in COMSCORE_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]

from tvgids_sentry_contracts import SENTRY_CONTRACTS
CONTRACTS += [row for row in SENTRY_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]

from tvgids_sdk_contracts import SDK_CONTRACTS
CONTRACTS += [row for row in SDK_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]

from tvgids_persisted_contracts import PERSISTED_CONTRACTS
CONTRACTS += [row for row in PERSISTED_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]

from tvgids_consent_contracts import CONSENT_CONTRACTS
CONTRACTS += [row for row in CONSENT_CONTRACTS if row[:2] not in {r[:2] for r in CONTRACTS}]
