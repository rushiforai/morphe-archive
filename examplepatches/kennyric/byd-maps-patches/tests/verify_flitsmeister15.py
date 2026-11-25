"""Independent emitted 15.0/1289 oracle for all nine public controls.

Frozen from publisher wrappers, captured holder values and independently reviewed
core-final, service, activity, library and receiver smali candidates. No production
Kotlin tables or analysis-directory files are read at verification time. Native
and Android runtime acceptance are separate; this checks emitted static contracts.
"""
import argparse
import hashlib
import importlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET
import zipfile

from verify_flitsmeister import NAMES, canonical, code

A = '{http://schemas.android.com/apk/res/android}'
NAV = 'Lnl/johninnl/flitsmeister/NavigationBroadcasts;'
NAV_CALL = re.compile(r'^\s*invoke-static(?:/range)? \{[^}]*\}, ' + re.escape(NAV) + r'->[^\n]+\n', re.M)
PROTECTED_MAPLIBRE = 'a16f4ce832821685d0e68196e7981f513659885b173ccfe8bcb4c895725f64f3'
STOCK_MAPLIBRE = '1e154a4640e4078f4fde31649771d93d4e5fee6f731f608d565d3b3f755ca8f9'

WRAPPERS = {'Landroidx/media3/exoplayer/offline/DownloadService;->onStartCommand(Landroid/content/Intent;II)I': {'original': ['6cd145d6030cb08b8b239200d64784fea002b13ebafa89e2453ada8807ba28e2',
                                                                                                                   [9,
                                                                                                                    21,
                                                                                                                    0,
                                                                                                                    0,
                                                                                                                    0]],
                                                                                                      'restored': ['dc1d79d4814ec1e4584407cc85ccfa99620caff40e6af7e4b00688da64703101',
                                                                                                                   [11,
                                                                                                                    168,
                                                                                                                    0,
                                                                                                                    0,
                                                                                                                    2]],
                                                                                                      'programs': {'8mSuPMx3MPD7iDZw': 'adeceb7a1e7113dbc418afa02e5d33ab9060b75c8547ebe1394e0fbb950f220e'}},
 'Landroidx/media3/ui/PlayerNotificationManager$NotificationBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['40a2548fa17c7e35339a637f70487f8e75da9f97d48437145db019ad55d84751',
                                                                                                                                                              [8,
                                                                                                                                                               12,
                                                                                                                                                               0,
                                                                                                                                                               0,
                                                                                                                                                               0]],
                                                                                                                                                 'restored': ['f77ac6d37f6dd4892a7d0d3f976e5506cf0bb1c88375f1d701c5a8820553b73f',
                                                                                                                                                              [5,
                                                                                                                                                               112,
                                                                                                                                                               0,
                                                                                                                                                               0,
                                                                                                                                                               0]],
                                                                                                                                                 'programs': {'45SSFJsyXBEwWtgz': '472a9100553f37b1e73d8a505795b52def735dd601f27b65159d7ac9913c6fc2'}},
 'Lcom/pairip/StartupLauncher;->launch()V': {'original': ['dfdf2ec1042363f91daecd26bf731b8758b3352d7caaa6c3a56226867ea86ac1',
                                                          [3, 17, 3, 3, 0]],
                                             'programs': {}},
 'Lcom/pairip/VMRunner$1;->run()V': {'original': ['a5378e3df7c7fa3b52501e75676f4eaf12cb2b4be19cd4eeb661fc07ca4ec05e',
                                                  [3, 4, 0, 0, 0]],
                                     'programs': {}},
 'Lcom/useinsider/insider/InsiderLoginActivity;->onCreate(Landroid/os/Bundle;)V': {'original': ['0b234a6aedd1d36aa29f587cf38f4cbe84e08af2583e94920fe88284947abe7b',
                                                                                                [7, 10, 0, 0, 0]],
                                                                                   'restored': ['bea4cae3bc88a8aa0110b96510ee80cead2b03aef751949a4296fd6edfb66d9a',
                                                                                                [10, 142, 2, 0, 0]],
                                                                                   'programs': {'WqKu6HXMirrJtgGO': '765048b3452d48d772ab3cf5d8ec7903e9bbde2fede5a66cfafb510307e74f22'}},
 'Lkjl;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['4169fca9cf648aa60629c6035ccda0582b241639794cbdc5d01d24eebb3f852c',
                                                                                       [8, 12, 0, 0, 0]],
                                                                          'restored': ['a9a48ff95ff95bf9cf2162678df5db9f0da8fd3c812bae253aa8aad307f61c20',
                                                                                       [19, 216, 2, 2, 0]],
                                                                          'programs': {'eipw0h0rNmETWOgv': '675d5916c9a2f617eed8ebf1c8fd8a675974534106cd37092f0a94d8a8e8eb53'}},
 'Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V': {'original': ['39f677ce4e7d18613a238dcefc10bf21e28305978e4d2356942e209704975b0c',
                                                                         [6, 8, 0, 0, 0]],
                                                            'restored': ['e5a41c259d6f7d2867877beafe269352cd5ffdcd7dcee32ba7a25df51e1eb2ff',
                                                                         [21, 230, 1, 0, 0]],
                                                            'programs': {'LBsZjgwAdSdCGW1e': '6290793babc0cdc8f31181e3d94a41e5af961d8066b98566811c8ba94a48f580'}},
 'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->onResume()V': {'original': ['28e58ebb2db056b0f28ba4837707d238f42b0a88df3005dba7d25f374ae4ce4c',
                                                                                                        [6,
                                                                                                         8,
                                                                                                         0,
                                                                                                         0,
                                                                                                         0]],
                                                                                           'restored': ['a72ce5731a565f769e968ef9200de5902c619c94a0fcafb7e35dcde3a79c88d9',
                                                                                                        [21,
                                                                                                         438,
                                                                                                         0,
                                                                                                         0,
                                                                                                         0]],
                                                                                           'programs': {'b0w8vgPuA1eoFNTt': '1af80ede201a6881d2a23ac5861feb31c84f2aaab8918423d0a954e5774c1c33'}},
 'Lnl/flitsmeister/controllers/activities/cropimage/CropImageActivity;->onCreate(Landroid/os/Bundle;)V': {'original': ['5e72a2e8ce8cc482ac178d47bc3783477e1b2bcc9ab0be0a5fdd5d55a5a08b89',
                                                                                                                       [7,
                                                                                                                        10,
                                                                                                                        0,
                                                                                                                        0,
                                                                                                                        0]],
                                                                                                          'restored': ['23096174e494fa0985fd113e960fed2776160d3b0bb91ea3180e3c65ace94e62',
                                                                                                                       [15,
                                                                                                                        178,
                                                                                                                        1,
                                                                                                                        0,
                                                                                                                        0]],
                                                                                                          'programs': {'OayAk1B8xFetCqjZ': '642dcce8b0473dec245f2fec49f1b5e8c04bc250bf609c65430b676bed90ae8c'}},
 'Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->onCreate(Landroid/os/Bundle;)V': {'original': ['7e16c9c256bbf5f6dd5469b3136f42061a7cd26d27e77c9cc42a73d4ddb691ea',
                                                                                                              [7,
                                                                                                               10,
                                                                                                               0,
                                                                                                               0,
                                                                                                               0]],
                                                                                                 'restored': ['78e0264d3921bf174771cc11e4397d4eced6db66701c794e847fcf7dfee575b9',
                                                                                                              [13,
                                                                                                               330,
                                                                                                               0,
                                                                                                               0,
                                                                                                               0]],
                                                                                                 'programs': {'EoRT8Q0n0KbLAu50': '1c0c0d1eed55ac782dec2e67c5df9c161d08e3f83995e475a327239315374d03'}},
 'Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V': {'original': ['bfd67dbf1aa7ecbdc533b0df6a07ca608e268f0fe34f4e7e4c6774e991073c75',
                                                                                                     [7, 10, 0, 0, 0]],
                                                                                        'restored': ['a0077737e258853b5974ccc190413b48dd0cc1ecd6c94a47e65fc7fb1686da7f',
                                                                                                     [22,
                                                                                                      747,
                                                                                                      0,
                                                                                                      0,
                                                                                                      0]],
                                                                                        'programs': {'mq2oLwBmLnxLU6o1': '86edf11569567860a28c0ba5181b386df000c95accfed97c4d556bc76e10f120'}},
 'Lnl/flitsmeister/launcher/presentation/LauncherActivity;->onResume()V': {'original': ['b49dfedb04af19a02503361399969b57ea7b100b0a538c5d6fb93031c574b9c1',
                                                                                        [6, 8, 0, 0, 0]],
                                                                           'restored': ['29edd62ccc34ba4e0ca8200eb536426588be50f616ef2c34cadb4d0ba777f24c',
                                                                                        [19, 1247, 1, 0, 0]],
                                                                           'programs': {'QV2QafOREIGgSZyv': 'f2ba39f6d3b865f507d2517967f1f51bc277cf59c24bb830e78c2b85f8dfbb69'}},
 'Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager$BluetoothDevicesReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['bad65d1a392f3612e372cc472a7ffed78bd53797952fbc0892fcdb7d7df3e598',
                                                                                                                                                                       [8,
                                                                                                                                                                        12,
                                                                                                                                                                        0,
                                                                                                                                                                        0,
                                                                                                                                                                        0]],
                                                                                                                                                          'restored': ['3a42c86e1e670c3ae35e9032d9139ec5e276d33a722a48295278c6eba38879dd',
                                                                                                                                                                       [7,
                                                                                                                                                                        77,
                                                                                                                                                                        0,
                                                                                                                                                                        0,
                                                                                                                                                                        0]],
                                                                                                                                                          'programs': {'J3PpjrlwTuTi8Ay7': '263f19739d42e31ca72c64fdec6a1ca92593a1375a783e464f2fdb65811ac247'}},
 'Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['96f17683edeaad62844b4805a3d130bc66235e1f46abcbdef44cf61d106c24ff',
                                                                                                                                                       [8,
                                                                                                                                                        12,
                                                                                                                                                        0,
                                                                                                                                                        0,
                                                                                                                                                        0]],
                                                                                                                                          'restored': ['796374981e9ce10d309f03e8503467f997bcbf0ec06cbc67b8261fd249d73d30',
                                                                                                                                                       [18,
                                                                                                                                                        225,
                                                                                                                                                        4,
                                                                                                                                                        1,
                                                                                                                                                        0]],
                                                                                                                                          'programs': {'f84JbW2VkAlvaukk': '93b1182402e316468a55eff409e79b442ae33c226ff142d353795dc52d376e92'}},
 'Lnl/flitsmeister/receivers/autostart/AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['5e887a6421890c26c68d9868fff44604cde20071d3cd144c6603e54773c9b24a',
                                                                                                                                                      [8,
                                                                                                                                                       12,
                                                                                                                                                       0,
                                                                                                                                                       0,
                                                                                                                                                       0]],
                                                                                                                                         'restored': ['941a6e8b990454876e4b30535e8098a56415b02ba5a9e738900236986a8a2c84',
                                                                                                                                                      [4,
                                                                                                                                                       61,
                                                                                                                                                       0,
                                                                                                                                                       0,
                                                                                                                                                       0]],
                                                                                                                                         'programs': {'wojvNhr4mTy8pcCh': 'fcb9748cb370fc360bdafee8fb761e0537c36f6b1066591c2404a2052e1b9ad8'}},
 'Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['6792916ff6bca3c253f2a3c0eb577480185d1d8f3a4cddda09a982803af82e26',
                                                                                                                                                     [8,
                                                                                                                                                      12,
                                                                                                                                                      0,
                                                                                                                                                      0,
                                                                                                                                                      0]],
                                                                                                                                        'restored': ['8325acb60d393ba504c9e5f407a0da4d0d37e83ba3a1cd8b373a3571467b5118',
                                                                                                                                                     [6,
                                                                                                                                                      78,
                                                                                                                                                      0,
                                                                                                                                                      0,
                                                                                                                                                      1]],
                                                                                                                                        'programs': {'S87ByAhlJV46n5Wl': 'b662d430fdec537ffc9806adb1758b46cd11a59fc9e2c34377df2ec80a4a36d8'}},
 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V': {'original': ['35ca103c573a973951536fa48bbd267cc3bcd14e6606fcac64bb4b5cde39b6cc',
                                                                                        [6, 8, 0, 0, 0]],
                                                                           'restored': ['1e3253c4c9cecf532da1b108cc3e8d1037b47e8341eda2df39fcd1f2e5bc0d86',
                                                                                        [13, 556, 15, 3, 0]],
                                                                           'programs': {'1UkEu2lRMiAKdriN': 'b3a9b7dbc243929b70232c578d3905033d2c5a84d0a697d225b8914fcc260563'}},
 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onStartCommand(Landroid/content/Intent;II)I': {'original': ['a834465d20c23719e1a7fcf9daab75ba9b8cb1f97530eef34afff4074f7559da',
                                                                                                                       [9,
                                                                                                                        21,
                                                                                                                        0,
                                                                                                                        0,
                                                                                                                        0]],
                                                                                                          'restored': ['a8161afb4d6f3136b31e43f7c7e7b83c5bc9dbd83f94fd0b42317b05272e9612',
                                                                                                                       [41,
                                                                                                                        796,
                                                                                                                        8,
                                                                                                                        2,
                                                                                                                        0]],
                                                                                                          'programs': {'Fxz6YV9Xh1xFSXmr': '2f33fea294a28558543446582d1515a16ec041fc7ca8d86fe1670c0e63b96500'}},
 'Lno/nordicsemi/android/ble/BleManagerHandler$b;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['d500e07ded8a6cb47d99bfa288146f356817dba893fbcf82abc31687aca59da0',
                                                                                                                                 [8,
                                                                                                                                  12,
                                                                                                                                  0,
                                                                                                                                  0,
                                                                                                                                  0]],
                                                                                                                    'restored': ['a49271e448e31304ef3808de19a30f93846ff1f64fab2126034603bb377ee034',
                                                                                                                                 [9,
                                                                                                                                  126,
                                                                                                                                  0,
                                                                                                                                  0,
                                                                                                                                  1]],
                                                                                                                    'programs': {'hCAzd1cDreEHmbvI': 'a7b3ef35392c5b4d0b284aed399d61703c0e8f326781c52348123892646d06dc'}},
 'Lno/nordicsemi/android/dfu/DfuServiceListenerHelper$ProgressBroadcastsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['44c19b6954cba0b2e5d8905b710eabfb7084a9d23d0e4e12ab838ee5a45d756f',
                                                                                                                                                                 [8,
                                                                                                                                                                  12,
                                                                                                                                                                  0,
                                                                                                                                                                  0,
                                                                                                                                                                  0]],
                                                                                                                                                    'restored': ['dff5111b745c703e08cfdccb4dc6dfafdf441097c1e2fe71a230f9f2837f8fdd',
                                                                                                                                                                 [10,
                                                                                                                                                                  140,
                                                                                                                                                                  0,
                                                                                                                                                                  0,
                                                                                                                                                                  1]],
                                                                                                                                                    'programs': {'pitu1iGVj6HrulkI': '61f1fa09922a07c7207a83bebbb1e211ed92dc657825bbefc18dc5107d679fea'}},
 'Lno/nordicsemi/android/support/v18/scanner/PendingIntentReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': {'original': ['d377141e0cfbeea9ad5b6e0be4138296d2c05d74fad78b655befa75539832bb8',
                                                                                                                                                   [8,
                                                                                                                                                    12,
                                                                                                                                                    0,
                                                                                                                                                    0,
                                                                                                                                                    0]],
                                                                                                                                      'restored': ['db56e0a26cec384cd6ff47dacd0022e621961536f23aced64192b917926d285a',
                                                                                                                                                   [40,
                                                                                                                                                    298,
                                                                                                                                                    6,
                                                                                                                                                    5,
                                                                                                                                                    0]],
                                                                                                                                      'programs': {'DD0nF2Z7yP6MIGB9': '00eb1c1317b9202c091881579e3fc007defbcee5d5fd524e20e18816f34f0d0f'}},
 'Lwei/mark/standout/StandOutWindow;->onStartCommand(Landroid/content/Intent;II)I': {'original': ['6cc4c7618548e11c6a68d8979a44a179343b009254c1565168bb9f77f5a6432a',
                                                                                                  [9, 21, 0, 0, 0]],
                                                                                     'restored': ['1231da94e706ce3c62057b4e61e3ca2f1856b109bd35c1d7b5b2a41df4f5c2b7',
                                                                                                  [10, 170, 8, 7, 0]],
                                                                                     'programs': {'J2vU3MI3gmqrWyZ6': '072ce722b10b00bf5e0d42fc4f5924e3f56d794735b3d520f5c273ab0efc73a2'}}}

VARIANTS = {'main-0-0': 'a0077737e258853b5974ccc190413b48dd0cc1ecd6c94a47e65fc7fb1686da7f',
 'main-0-1': '8581b353b1fe03a96d1a764cabe81c1db6c8a856f16325fbbb29715ee199ac3a',
 'main-1-0': '744c8e7f557e48822bd23191f521371143d09e1879421c7a155d3ef117467d4f',
 'main-1-1': '381c83dc71f1c6044775c69a6a727314237cdb05f71c53d219f10f28922abd7e',
 'unlock': '69b571c0cce95d72a29fdeecee850d7d82ba4315ee7d56c4fcb35bbd510b0276',
 'tracking': 'c964bf4c6ce4de11f1c399afe391e9873b72fd85e6691d394d65f4992613e3e5',
 'application-tracking': '3bc28e644f7204803be3626e2734449c38815cef19a0b66a147ba0925964b6ac'}

HOLDERS = {'Landroidx/appcompat/resources/jZ/AbeNSSj;': [32, '847bcc0b4113996fe61002509e0ea7df656ff72d5da95215b2f5ee2cfc7cbbb2'],
 'Landroidx/appcompat/view/TP/jeydiKIN;': [42, '0d48c41130033fc40ab5c020d8fc557123612b94c089f987fee18bc2d4ecdbab'],
 'Landroidx/arch/core/AQ/YaBnj;': [54, 'f7b7b36d60aa4306888703b006222cdf3f90cc565f350d84c4c9df8b3d68071a'],
 'Landroidx/car/app/suggestion/model/LO/cBfvTFKDjgcdmY;': [35,
                                                           'b616176aa1b5fa944f839b9a940f4484e0f36c6c67d89af8ceae718061202916'],
 'Landroidx/compose/foundation/text/contextmenu/provider/Rcsl/tjHMUYS;': [50,
                                                                          'f649d557deb95ecf96a2982098244d92d6b0cf0284b474f0b4aa3f5341db3617'],
 'Landroidx/lifecycle/YhGP/JgBAof;': [46, '5e48106f3733786a34f981812a65cd1fc2d77ba7fb476ff908d9dc75e2c07356'],
 'Landroidx/media/utils/NYZ/gVdoZ;': [36, '21de44871ce9e7a9ce159af8af88211d995efa1e6ce3529539935fc6f758b6ea'],
 'Landroidx/media3/extractor/amr/IPx/kSuHEs;': [54, '6acb353e31c45b86a22587c1c8466364dad169b466bd82155f06ad7733cc76ad'],
 'Landroidx/media3/extractor/jpeg/pVoW/VdtzxgUVzvG;': [45,
                                                       'f11e0d842925a9bc5fe12b7b624383d4ef9457c8d9256b3b9bb5fd1ab7bcfbcb'],
 'Landroidx/media3/extractor/text/ssa/sR/KYOPUVpCnzYR;': [49,
                                                          '19704d02a7902518c52602c25f2e16562b89c4b0e725ce475bbfef46185b309e'],
 'Landroidx/preference/Yxi/aMvChe;': [44, '0166e2bc7f41e029517958f7ac4b219f52321c7460be28d73ee4b15430121d5a'],
 'Landroidx/room/concurrent/WQJ/iNWotHlDhPiH;': [48,
                                                 '3f214b021a4788655848cbbe177891a9c36f1348fb6a4b6f15cb1e440f9cb822'],
 'Landroidx/sqlite/util/Zcx/StDI;': [58, 'f82c1bbe6e7777d5f242bfadfd3b8f744930328876fbc7497bc21802464525eb'],
 'Lch/qos/logback/classic/db/ylLn/xpozOGDzkyux;': [41,
                                                   'ec2e30a6c6bdf4d84224ed53449b0316617e6b19d6b3ba284f8bcc16b35f2d09'],
 'Lch/qos/logback/classic/pattern/RO/VYVjsJGprHdrz;': [35,
                                                       '019ca075b612695b5c5404dbc250cd705954d4096ca62b0d2b1a4ece16450ba5'],
 'Lch/qos/logback/core/joran/spi/QStd/HIDEl;': [46, 'a012e03e48878878385d57124d8315cfd08cc9992ca322ae8d6b3e7004aa3006'],
 'Lcom/fasterxml/jackson/databind/jsontype/impl/Fcbp/DSsY;': [47,
                                                              'f999a0dad5f41dba9248ad91f375ae5aed6dce352dd95d142064c19ec4e6634f'],
 'Lcom/fasterxml/jackson/databind/util/fPK/EyVLLB;': [51,
                                                      'c6cc68be7cdb76453dbb61b6df8d2f253535365702787b11bf5c99788a60b06b'],
 'Lcom/google/android/gms/common/api/internal/LZ/QdNnTgCC;': [33,
                                                              '1c3acf07dd95e90786c364dacbcf15730d9765eae59d0a0ae5c740da5f115e72'],
 'Lcom/google/gson/internal/bind/util/gXe/KJhLyoXeMTI;': [58,
                                                          'a97288c1c4ad4b50b3cc33c5b15d3c4efa93bdca1451dcad7a02ea089cb16a76'],
 'Lnl/flitsmeister/account/data/db/type_converter/Tn/mpnQk;': [33,
                                                               'f121c2efc40404b1b8cbd04339027b842f51590a72802861656d1d8fb388dcf8'],
 'Lnl/flitsmeister/fmcore/feature/trafficlight/view/MyT/NdjkEcaOrXR;': [34,
                                                                        'bfb4417f9cff8385b41c2a6940b21272264cdcdff6d828378204bfe4d874c4d1'],
 'Lnl/flitsmeister/fmcore/service/lookahead/model/itm/oubH;': [41,
                                                               'd073fa24af392824875c631f0f2090452eeaf3e2f0e7ad45de970dfb7525fb92'],
 'Lnl/flitsmeister/models/data/ADV/kpDS;': [45, '1543f0c6b47670f00ecc078ef7c01a9bd7717c1b0084bff2f3ea4cf090a62ce0'],
 'Lnl/flitsmeister/models/listitems/progressbar/XkPL/UudhawsZhIZDyO;': [47,
                                                                        'a004a89ec4127b7d03abc921a7b17c916fc071da9c49225b5a80dfe73b685475'],
 'Lno/nordicsemi/android/ble/callback/profile/HJNV/hpOqNO;': [52,
                                                              'f903dc79c29e4bda4655ac458214a928b718a306782e014cd57f3c398ac556d4'],
 'Lorg/bouncycastle/jcajce/provider/asymmetric/ies/oaa/NojmxJ;': [47,
                                                                  'f34be411ff65d6c8627c672664fbbdefce37fcf721f0fe6f3d7e6084c7c2dbe5'],
 'Lorg/bouncycastle/pqc/crypto/Ntw/PzlUg;': [41, '42d8f2d81ef6ee489d07d273bd5a00a506c4d4e0bc316fbeb834e577fa3be372'],
 'Lorg/joda/time/format/lyb/hqRFdGNbyTnj;': [47, '80a0f91b964226eb9b3d2dfb85165f5e0bde1af8e9689160d125942416cc82b1'],
 'Lorg/maplibre/navigation/android/core/bYY/MWtDAv;': [43,
                                                       'ff2a67d1ea595f6ec81922a2b06d5b0573ac88aab772ca5d9f103193fc8c2f1d'],
 'Lorg/maplibre/navigation/android/navigation/v5/location/replay/GIjd/YtnWqfOD;': [34,
                                                                                   'eb1040fe7ed1746fc5e30676a9ebe9b19e1a092e1a271db9e40551d1556f6ad3'],
 'Lzendesk/ui/android/conversation/articleviewer/feedbackbanner/kKYe/TlRkqS;': [53,
                                                                                '827bb52677d261f54e01b5b0be89cdd888f54382c98e60ea1dfdeb4cd10913f6']}

PERMISSIONS = [['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.READ_CALENDAR')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.VIBRATE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.INTERNET')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_WIFI_STATE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_NETWORK_STATE')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_COARSE_LOCATION')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_FINE_LOCATION')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_BACKGROUND_LOCATION')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}maxSdkVersion', '30'),
   ('{http://schemas.android.com/apk/res/android}name', 'android.permission.BLUETOOTH')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}maxSdkVersion', '30'),
   ('{http://schemas.android.com/apk/res/android}name', 'android.permission.BLUETOOTH_ADMIN')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.BLUETOOTH_CONNECT')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.BLUETOOTH_SCAN'),
   ('{http://schemas.android.com/apk/res/android}usesPermissionFlags', 'neverForLocation')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.WAKE_LOCK')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.BROADCAST_STICKY')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.MODIFY_AUDIO_SETTINGS')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.READ_PHONE_STATE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.SYSTEM_ALERT_WINDOW')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.RECEIVE_BOOT_COMPLETED')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_NOTIFICATION_POLICY')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.RECORD_AUDIO')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.FOREGROUND_SERVICE')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'androidx.car.app.ACCESS_SURFACE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'androidx.car.app.NAVIGATION_TEMPLATES')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.SCHEDULE_EXACT_ALARM')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.READ_CONTACTS')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}maxSdkVersion', '28'),
   ('{http://schemas.android.com/apk/res/android}name', 'android.permission.WRITE_EXTERNAL_STORAGE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.POST_NOTIFICATIONS')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'com.google.android.gms.permission.AD_ID')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.FOREGROUND_SERVICE_LOCATION')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.DOWNLOAD_WITHOUT_NOTIFICATION')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}maxSdkVersion', '32'),
   ('{http://schemas.android.com/apk/res/android}name', 'android.permission.READ_EXTERNAL_STORAGE')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.USE_BIOMETRIC')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.USE_FINGERPRINT')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'com.android.vending.BILLING')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'com.google.android.c2dm.permission.RECEIVE')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name',
    'com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_ADSERVICES_ATTRIBUTION')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_ADSERVICES_AD_ID')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'android.permission.REORDER_TASKS')]],
 ['permission',
  [('{http://schemas.android.com/apk/res/android}name', 'nl.flitsmeister.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION'),
   ('{http://schemas.android.com/apk/res/android}protectionLevel', 'signature')]],
 ['uses-permission',
  [('{http://schemas.android.com/apk/res/android}name', 'nl.flitsmeister.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION')]],
 ['uses-permission-sdk-23',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_COARSE_LOCATION')]],
 ['uses-permission-sdk-23',
  [('{http://schemas.android.com/apk/res/android}name', 'android.permission.ACCESS_FINE_LOCATION')]],
 ['uses-permission', [('{http://schemas.android.com/apk/res/android}name', 'com.android.vending.CHECK_LICENSE')]]]

PAIRIP = {'Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V': ['a5f680379896523d4cc1507f7418f252294252b6e2d033b98bca68ddbf23ae3f',
                                                                              [3, 41, 2, 0, 0]],
 'Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V': ['28eb043227b6d568e4b48974bf5641ea4be351040d5b4765d8c562c1846abad1',
                                                                                       [3, 16, 0, 0, 0]],
 'Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V': ['fb232249b4464561873a3c5ad2274a3f3c88e50b36785de71a1502a6da06a8b2',
                                                                        [4, 29, 1, 0, 0]],
 'Lcom/pairip/licensecheck/LicenseClient;->startErrorDialogActivity()V': ['8da21e59bf66b1f3f99b9c1f5a2d7ad4d60d6643736973018318fd2d9b14397c',
                                                                          [4, 9, 0, 0, 0]],
 'Lcom/pairip/licensecheck/LicenseClient;->startPaywallActivity(Landroid/app/PendingIntent;)V': ['276493a2bae98285ef13ae8acd2b0cf4973a63dbdfd5389b636b5465b4db960b',
                                                                                                 [4, 11, 0, 0, 0]],
 'Lcom/pairip/licensecheck/LicenseActivity;->onStart()V': ['cd4f4af8f1ac8dcf98521bc46e02d873910cf2ffff3edab9cc73718fe7a87427',
                                                           [3, 20, 1, 0, 0]],
 'Lcom/pairip/VMRunner;-><clinit>()V': ['ce9f2ae06de30c1431f2d5d835d0bc324207a6447045744d70d8c43ac377599e',
                                        [1, 3, 0, 0, 0]],
 'Lcom/pairip/VMRunner;->invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;': ['8d1b45c68c09b508e16b2594320808caef5a6e6b10336717a122edabc2df26af',
                                                                                            [8, 46, 1, 0, 0]],
 'Lcom/pairip/VMRunner;->isDebuggingEnabled()Z': ['9e3edec725e5784877450ded81d0b15174a039c9d0dd49972bff5792f9235ea4',
                                                  [2, 5, 0, 0, 0]]}


def source(root, cls):
    paths = list(root.glob('smali*/' + cls[1:-1] + '.smali'))
    assert len(paths) == 1, f'Expected singleton 15 class {cls}: {len(paths)}'
    return paths[0].read_text()


def method(root, descriptor):
    cls, signature = descriptor.split('->')
    found = re.findall(r'^\.method[^\n]* ' + re.escape(signature) + r'\n.*?^\.end method',
                       source(root, cls), re.M | re.S)
    assert len(found) == 1, 'Expected singleton 15 method: ' + descriptor
    return found[0]


def sha(value):
    return hashlib.sha256(value).hexdigest()


def body_hash(body):
    return sha('\n'.join(canonical(body)).encode())


def shape(body):
    """Count DEX instructions including payloads, and every handler directive."""
    signature = body.splitlines()[0].split()[-1]
    params = re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', signature.split('(', 1)[1].split(')')[0])
    words = sum(2 if parameter in ('J', 'D') else 1 for parameter in params)
    words += int(' static ' not in body.splitlines()[0])
    count = re.search(r'\.(locals|registers) (\d+)', body)
    assert count, 'Missing register count'
    registers = int(count[2]) + (words if count[1] == 'locals' else 0)
    instructions = [line for line in code(body) if not line.startswith(':')]
    return [registers, len(instructions), len(re.findall(r'^\s*\.catch', body, re.M)),
            len(re.findall(r'^\s*\.catchall', body, re.M)),
            sum(line.startswith('PAYLOAD ') for line in instructions)]


def yaml_scalar(root, name):
    path = root / 'apktool.yml'
    if not path.is_file():
        return None
    values = re.findall(r'^\s*' + re.escape(name) + r':\s*[\'"]?([^\'"\n]+?)[\'"]?\s*$',
                        path.read_text(), re.M)
    assert len(values) <= 1, 'Ambiguous decoded metadata: ' + name
    return values[0].strip() if values else None


def decoded_profile(root):
    """Use decoded package/version metadata, never the directory or APK filename."""
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'nl.flitsmeister', 'Expected Flitsmeister package'
    result = []
    for attribute in ('versionName', 'versionCode'):
        xml = manifest.get(A + attribute)
        yaml = yaml_scalar(root, attribute)
        assert xml is None or yaml is None or xml == yaml, 'Conflicting decoded ' + attribute
        result.append(xml if xml is not None else yaml)
    return tuple(result)


def verify_manifest(root, selected):
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert decoded_profile(root) == ('15.0', '1289'), 'Expected inspected 15.0/1289 profile'
    sdk = manifest.find('uses-sdk')
    minimum = sdk.get(A + 'minSdkVersion') if sdk is not None else yaml_scalar(root, 'minSdkVersion')
    assert minimum in ('29', '32'), 'Expected inspected minSdk 29 or 32 split variant'
    removed = {'com.android.vending.CHECK_LICENSE'} if selected else set()
    if 'Disable tracking' in selected:
        removed |= {'com.google.android.gms.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_AD_ID',
                    'android.permission.ACCESS_ADSERVICES_ATTRIBUTION'}
    expected = [(tag, tuple(map(tuple, attributes))) for tag, attributes in PERMISSIONS
                if dict(attributes).get(A + 'name') not in removed]
    actual = [(node.tag, tuple(sorted(node.attrib.items()))) for node in manifest if 'permission' in node.tag]
    assert sorted(actual) == sorted(expected), 'Only selected license/advertising permissions may change'
    licenses = [node for node in manifest.findall('application/activity')
                if node.get(A + 'name') == 'com.pairip.licensecheck.LicenseActivity']
    assert len(licenses) == int(not selected), 'License activity removed exactly when startup is restored'
    return int(minimum)


def verify_holders(root, restored):
    total = 0
    for cls, (count, expected_hash) in HOLDERS.items():
        text = source(root, cls)
        fields = re.findall(r'^\.field public static ([^: ]+):Ljava/lang/String;\s*$', text, re.M)
        assert len(fields) == count and len(set(fields)) == count, cls + ': captured holder cardinality'
        clinit = re.findall(r'^\.method[^\n]* <clinit>\(\)V\n.*?^\.end method', text, re.M | re.S)
        assert len(clinit) == int(restored), cls + ': initializer only after restoration'
        if not restored:
            continue
        assert shape(clinit[0]) == [1, 2 * count + 1, 0, 0, 0], cls + ': exact initializer shape'
        instructions = canonical(clinit[0])
        assert instructions[-1] == 'return-void'
        values = {}
        for index in range(0, 2 * count, 2):
            literal = re.fullmatch(r'const-string v0, (".*")', instructions[index])
            assignment = re.fullmatch(r'sput-object v0, ' + re.escape(cls) + r'->([^:]+):Ljava/lang/String;',
                                      instructions[index + 1])
            assert literal and assignment, cls + ': unconditional literal assignment'
            name = assignment[1]
            assert name in fields and name not in values, cls + ': unique declared field assignment'
            values[name] = json.loads(re.sub(r"(?<!\\)((?:\\\\)*)\\'", lambda match: match[1] + "'", literal[1]))
        actual_hash = sha(json.dumps(values, sort_keys=True, ensure_ascii=True, separators=(',', ':')).encode())
        assert actual_hash == expected_hash, cls + ': captured initialized string values'
        total += len(values)
    assert len(HOLDERS) == 32 and (total == 1421 if restored else total == 0)
    return total


def expected_restored_hash(descriptor, selected):
    if descriptor == 'Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V' and 'Disable tracking' in selected:
        return VARIANTS['application-tracking']
    if 'MainActivity;' in descriptor:
        return VARIANTS[f'main-{int("Disable partner services" in selected)}-{int("Hide Pro notices" in selected)}']
    if 'FlitsmeisterBaseService;' in descriptor:
        if 'onStartCommand' in descriptor and 'Disable tracking' in selected:
            return VARIANTS['tracking']
        if 'onDestroy' in descriptor and 'Unlock Pro' in selected:
            return VARIANTS['unlock']
    return WRAPPERS[descriptor]['restored'][0]


# Publisher constructor independently retains the ETA Boolean=false flow and
# Integer LiveData initialization; this guards the semantic backing fields used
# by the restored MainActivity (o2 and h2) as well as their emitted operands.
MAIN_MODEL = ('Lnl/flitsmeister/fmx/activities/main/k;-><init>('
              'Landroid/app/Application;Ly43;Lnoc;Lu25;'
              'Lnl/flitsmeister/parking/domain/repository/account/ParkingAccountRepository;'
              'Lmb;Laqe;Lfje;Licj;Lm46;Lgm8;Llob;La4d;Lw4d;Lr4d;Lj4d;Lza9;La52;'
              'Lyii;Lia9;Lnaa;Lhii;Liki;Lx62;Lp4d;)V')
MAIN_MODEL_HASH = 'a7001ca1aef7c02fd05e1d64a01a94b78c3690bcb84e015e4516f50643b722b4'


# Independently decoded publisher Lt28.<clinit>, plus stored-key correspondence
# in service/preference-map.json. M and N are deliberately both included: their
# identical Ltuh descriptors hide incompatible Long(-1) and Boolean(true) values.
PREFERENCE_CATALOG_HASH = 'c97915f32e8d40b4d92717c884248c07ec4172f26e9dbca9b7cecf13cfd191f8'
PREFERENCE_BINDINGS = {
    'M': ('pref_user_updated_to_version', 'Long', -1),
    'N': ('pref_show_vehicle_profile_bottom_sheet', 'Boolean', True),
    'D0': ('pref_fm_payment_mandate', 'String', ''),
    'u1': ('pref_hud_autostart', 'Boolean', False),
    'w1': ('pref_hud_autostart_when_opening', 'Boolean', False),
    'G1': ('pref_pending_fm_one_update_notes', 'String', ''),
    'H1': ('pref_pending_fm_two_update_notes', 'String', ''),
    'P0': ('pref_pro_subscription_expired_shown', 'Boolean', True),
}
PREFERENCE_USES = {
    'Launcher': ('M', 'M', 'D0', 'D0', 'D0', 'D0'),
    'Main': ('u1', 'w1', 'H1', 'G1', 'P0'),
}


def preference_bindings(body):
    """Read literal stored keys and boxed default types from emitted clinit.

    Track object aliases and scalar values; unrelated factory results stay
    unknown. This is a narrow straight-line publisher initializer decoder,
    rather than a JVM interpreter or an ordinal field-name correspondence.
    """
    registers, bindings, result = {}, {}, None
    for line in canonical(body):
        opcode, _, arguments = line.partition(' ')
        if opcode == 'new-instance':
            register, typ = arguments.split(', ')
            registers[register] = {} if typ == 'Ltuh;' else ('unknown', typ)
        elif opcode == 'const-string':
            register, literal = arguments.split(', ', 1)
            literal = re.sub(r"(?<!\\)((?:\\\\)*)\\'", lambda match: match[1] + "'", literal)
            registers[register] = ('String', json.loads(literal))
        elif opcode.startswith('const'):
            register, value = arguments.split(', ')
            registers[register] = ('wide' if opcode.startswith('const-wide') else 'integer', int(value, 16))
        elif opcode == 'sget-object':
            register, reference = arguments.split(', ')
            if reference in ('Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;',
                             'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;'):
                registers[register] = ('Boolean', '->TRUE:' in reference)
            else:
                registers[register] = ('unknown', reference)
        elif opcode.startswith('move-result'):
            registers[arguments] = result
        elif opcode.startswith('move-object'):
            target, origin = arguments.split(', ')
            registers[target] = registers.get(origin)
        elif opcode.startswith('invoke-'):
            reference = line.split('}, ', 1)[1]
            if reference == 'Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;':
                first = line.split('{', 1)[1].split('}', 1)[0].split(', ')[0].split(' .. ')[0]
                value = registers.get(first)
                assert value and value[0] == 'wide', 'Long default must use literal wide value'
                result = ('Long', value[1])
            else:
                result = ('unknown', reference)
        elif opcode == 'iput-object':
            value, obj, reference = arguments.split(', ')
            target = registers.get(obj)
            if isinstance(target, dict) and reference in ('Ltuh;->a:Ljava/lang/String;', 'Ltuh;->b:Ljava/lang/Object;'):
                target[reference.split('->')[1][0]] = registers.get(value)
        elif opcode == 'sput-object':
            register, reference = arguments.split(', ')
            field = re.fullmatch(r'Lt28;->([^:]+):Ltuh;', reference)
            if field:
                target = registers.get(register)
                assert isinstance(target, dict), 'Preference entry needs a real Ltuh object'
                assert field[1] not in bindings, 'Duplicate preference field initialization'
                key, default = target.get('a'), target.get('b')
                assert key and default, f'Stored preference key/default required for {field[1]}: {target!r}'
                stored_key = key[1] if key[0] == 'String' else ('unresolved-reference', key[1])
                bindings[field[1]] = (stored_key, default[0], default[1])
        elif opcode in ('new-array', 'filled-new-array'):
            # Results of unrelated collection factories cannot become accepted
            # scalar defaults through an old value left in the result register.
            result = ('unknown', opcode)
            if opcode == 'new-array':
                registers[arguments.split(', ', 1)[0]] = result
        elif opcode == 'return-void':
            pass
        else:
            raise AssertionError('Unsupported preference initializer instruction: ' + line)
    return bindings


def verify_preference_sites(body, owner, bindings):
    references = re.findall(r'sget-object \w+, Lt28;->([^:]+):Ltuh;', body)
    expected = PREFERENCE_USES[owner]
    assert len(references) == len(expected), owner + ': closed literal-key preference site inventory'
    for index, (field, expected_field) in enumerate(zip(references, expected)):
        contract = PREFERENCE_BINDINGS[expected_field]
        assert bindings.get(field) == contract, (
            f'{owner} preference site {index}: expected {contract[1]} {contract[0]} default={contract[2]!r}; '
            f'{field} actually binds {bindings.get(field)!r}')


def verify_preferences(root, restored):
    catalog = method(root, 'Lt28;-><clinit>()V')
    assert shape(catalog) == [11, 1049, 0, 0, 0] and body_hash(catalog) == PREFERENCE_CATALOG_HASH, 'Publisher preference key/default catalog changed'
    bindings = preference_bindings(catalog)
    assert len(bindings) == 160, 'Complete publisher preference catalog'
    for field, expected in PREFERENCE_BINDINGS.items():
        assert bindings[field] == expected, field + ': independent stored key, boxed type and default'
    if restored:
        verify_preference_sites(method(root, 'Lnl/flitsmeister/launcher/presentation/LauncherActivity;->onResume()V'), 'Launcher', bindings)
        verify_preference_sites(method(root, 'Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V'), 'Main', bindings)
    return bindings


# The publisher15 application VM asset identifies the String user-ID Runnable
# h85 and its q85/String constructor. Publisher15 m85 instead accepts a Map of
# custom keys; same-looking obfuscated names are not semantic counterparts.
APPLICATION_JOB_RECORDS = ((88697, 179, 'h85'), (115055, 41, 'q85'),
                           (27795, 115, '(Lq85;Ljava/lang/String;)V'))
APPLICATION_JOB_METHODS = {
    'Lh85;-><init>(Lq85;Ljava/lang/String;)V':
        ('1b66b0c15555ce5e0b39192f374c781a955c0d1d6aca048a1ce5afa27edc2654', [3, 4, 0, 0, 0]),
    'Lh85;->run()V':
        ('7d658d8c7ed675484e320d8988eddf9a9d7e9f81d5157454f7a42246d2898edf', [5, 38, 2, 2, 0]),
}
APPLICATION_JOB = (
    'invoke-static {}, Lfb8;->a()Lfb8;',
    'move-result-object v0',
    'iget-object v0, v0, Lfb8;->a:Lq85;',
    'iget-object v5, v0, Lq85;->o:Ly95;',
    'iget-object v5, v5, Ly95;->a:Lu95;',
    'new-instance v6, Lh85;',
    'invoke-direct {v6, v0, v4}, Lh85;-><init>(Lq85;Ljava/lang/String;)V',
    'invoke-static {v5, v6}, Lnl/flitsmeister/FlitsmeisterApplication;->a$018(Lu95;Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;',
)
APPLICATION_COUNTRY = (
    'invoke-static {}, Lfb8;->a()Lfb8;',
    'move-result-object v0',
    'sget v4, Lm65;->b:I',
    'invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;',
    'move-result-object v4',
    'invoke-static {v4}, Lnl/flitsmeister/fmcore/data/enums/UserCountries;->getCountryCode(Ljava/lang/Integer;)Ljava/lang/String;',
    'move-result-object v4',
    'const-string v5, "current_country"',
    'invoke-static {v0, v5, v4}, Lnl/flitsmeister/FlitsmeisterApplication;->d$019(Lfb8;Ljava/lang/String;Ljava/lang/String;)V',
)


def verify_application_job_instructions(instructions, tracking):
    expected = list(APPLICATION_JOB)
    if tracking:
        expected[0] = 'goto @100'
    assert instructions[92:100] == expected, (
        'Application String user-ID job: exact h85/q85/String constructor and queue; '
        'skip only when Disable tracking is selected')
    assert instructions[100:109] == list(APPLICATION_COUNTRY), 'Preserve application country-report continuation'


def verify_application_job(root, restored, tracking):
    key = (root / 'assets/Fxz6YV9Xh1xFSXmr').read_bytes()[0x2026c:0x2036c]
    assert sha(key) == '576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1', 'Publisher native decoding key'
    data = (root / 'assets/LBsZjgwAdSdCGW1e').read_bytes()
    for offset, phase, expected in APPLICATION_JOB_RECORDS:
        size = (data[offset] ^ key[phase]) | ((data[offset + 1] ^ key[(phase + 1) % 256]) << 8)
        value = bytes(data[offset + index] ^ key[(phase + index) % 256] for index in range(2, size + 2))
        assert value == expected.encode(), f'Application native String user-ID binding at {offset}/{phase}'
    for descriptor, (expected_hash, expected_shape) in APPLICATION_JOB_METHODS.items():
        body = method(root, descriptor)
        assert shape(body) == expected_shape and body_hash(body) == expected_hash, descriptor + ': genuine publisher String user-ID Runnable'
    if restored:
        body = method(root, 'Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V')
        verify_application_job_instructions(canonical(body), tracking)


def verify_startup(root, selected):
    restored = bool(selected)
    verify_preferences(root, restored)
    verify_application_job(root, restored, 'Disable tracking' in selected)
    functional = 0
    for descriptor, record in WRAPPERS.items():
        body = method(root, descriptor)
        if 'restored' in record:
            functional += 1
            expected_hash, expected_shape = record['restored' if restored else 'original']
            if restored:
                assert 'Lcom/pairip/VMRunner;' not in body, descriptor + ': functional VM delegation remains'
                # Hook signature, placement, parameters and closed callsite inventory
                # are checked separately by the navigation leaf oracle.
                body = NAV_CALL.sub('', body + '\n')
                if descriptor == 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V':
                    from verify_flitsmeister_release import normalize_destroy
                    body = normalize_destroy(body, 'Broadcast navigation data' in selected)
                expected_hash = expected_restored_hash(descriptor, selected)
            else:
                assert body.count('Lcom/pairip/VMRunner;->invoke(') == 1, descriptor + ': publisher program retained'
            assert shape(body) == expected_shape, descriptor + ': registers/instructions/handlers/catchall/payloads'
            assert body_hash(body) == expected_hash, descriptor + ': complete independently reviewed body'
        else:
            # Keep both dispatcher classifications explicit. StartupLauncher is
            # disabled; the dormant VMRunner$1 body retains its publisher contract.
            if restored and 'StartupLauncher;' in descriptor:
                assert canonical(body) == ['return-void'] and shape(body) == [3, 1, 0, 0, 0]
            else:
                assert body_hash(body) == record['original'][0] and shape(body) == record['original'][1]
        for program, expected_hash in record['programs'].items():
            assert sha((root / 'assets' / program).read_bytes()) == expected_hash, descriptor + ': original native program'
    assert functional == 20 and len(WRAPPERS) == 22
    model = method(root, MAIN_MODEL)
    assert shape(model) == [43, 710, 0, 0, 0] and body_hash(model) == MAIN_MODEL_HASH, 'Main model Integer/ETA Boolean backing contracts'
    for descriptor, (original_hash, original_shape) in PAIRIP.items():
        body = method(root, descriptor)
        if not restored:
            assert body_hash(body) == original_hash and shape(body) == original_shape, descriptor
            continue
        signature = descriptor.split('->')[1]
        expected = ['return-void']
        if signature.startswith('invoke('):
            expected = ['const/4 v0, 0x0', 'return-object v0']
        elif signature == 'isDebuggingEnabled()Z':
            expected = ['const/4 v0, 0x1', 'return v0']
        elif signature == 'onStart()V':
            local = original_shape[0] - 1
            expected = [f'invoke-super {{v{local}}}, Landroid/app/Activity;->onStart()V',
                        f'invoke-virtual {{v{local}}}, Lcom/pairip/licensecheck/LicenseActivity;->finish()V', 'return-void']
        assert canonical(body) == expected, descriptor + ': closed startup bypass contract'
        assert shape(body)[0] == original_shape[0], descriptor + ': retained registers'
    return {'functional_wrappers': functional, 'dispatchers': 2, 'restored': restored}


def verify_native(root, restored, apk=None):
    name = 'lib/arm64-v8a/libmaplibre.so'
    decoded = root / name
    expected = STOCK_MAPLIBRE if restored else PROTECTED_MAPLIBRE
    checked = []
    if decoded.is_file():
        assert sha(decoded.read_bytes()) == expected, 'Decoded arm64 MapLibre protected/stock identity'
        checked.append('decoded')
    if apk is not None:
        with zipfile.ZipFile(apk) as archive:
            if name in archive.namelist():
                assert archive.namelist().count(name) == 1, 'Duplicate packaged native library'
                assert sha(archive.read(name)) == expected, 'Actual APK arm64 MapLibre protected/stock identity'
                checked.append('apk')
            else:
                assert not restored, 'Selected APK lacks restored arm64 MapLibre'
    assert checked or not restored, 'Selected decoded tree needs native library or --apk'
    return checked or ['unavailable in base-only publisher input']


def verify_leaves(root, selected):
    unlock = 'Unlock Pro' in selected
    notices = 'Hide Pro notices' in selected
    ads = 'Hide ads' in selected
    tracking = 'Disable tracking' in selected
    partner = 'Disable partner services' in selected
    checks = [
        ('verify_flitsmeister15_features', (unlock, notices, ads)),
        ('verify_flitsmeister15_ads', (ads, unlock, partner)),
        ('verify_flitsmeister15_tracking', (tracking,)),
        ('verify_flitsmeister15_telemetry_leaves', (tracking,)),
        ('verify_flitsmeister15_partner_leaves', (partner, notices, ads)),
        ('verify_flitsmeister15_guest', ('Guest mode' in selected,)),
        ('verify_flitsmeister_navigation15', ('Broadcast navigation data' in selected,)),
    ]
    for module, flags in checks:
        importlib.import_module(module).verify(root, *flags)
    return len(checks)


def verify(root, selected, apk=None):
    selected = set(selected)
    assert selected <= NAMES, 'Unknown public selection'
    from verify_flitsmeister_release import verify as verify_release
    verify_release(root, selected, 15)
    minimum = verify_manifest(root, selected)
    startup = verify_startup(root, selected)
    holders = verify_holders(root, bool(selected))
    native = verify_native(root, bool(selected), apk)
    leaves = verify_leaves(root, selected)
    result = {**startup, 'min_sdk': minimum, 'initialized_strings': holders,
              'native_checked': native, 'leaf_verifiers': leaves, 'selected': sorted(selected)}
    print('PASS: Flitsmeister 15 emitted static contracts; ' + json.dumps(result, sort_keys=True))
    return result


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('-e', '--enable', action='append', default=[], choices=sorted(NAMES))
    parser.add_argument('--apk', type=Path)
    args = parser.parse_args()
    verify(args.decoded, set(args.enable), args.apk)
