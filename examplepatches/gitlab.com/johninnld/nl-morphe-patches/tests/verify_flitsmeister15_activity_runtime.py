"""Verify restored secondary activities against original publisher 15.0 smali.

Checks exact wrappers, complete ordered nonstatic delegates, callback captures
and discriminator values, member signatures/hierarchy, original native encrypted
binding records, all typed operations/registers and provider/factory semantics.
Android acceptance is separate.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re

SOURCE = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/flitsmeister/ActivityRuntime15.kt'
PROFILES = {
    'hud': ('hudActivityOnCreate', 'nl/flitsmeister/features/hud/views/activities/HUDActivity', 'onCreate(Landroid/os/Bundle;)V', 13, 330, 7, 10, 63),
    'crop': ('cropImageActivityOnCreate', 'nl/flitsmeister/controllers/activities/cropimage/CropImageActivity', 'onCreate(Landroid/os/Bundle;)V', 15, 178, 7, 10, 46),
    'cits': ('citsParkingActivityOnResume', 'nl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity', 'onResume()V', 21, 438, 6, 8, 121),
    'insider': ('insiderLoginActivityOnCreate', 'com/useinsider/insider/InsiderLoginActivity', 'onCreate(Landroid/os/Bundle;)V', 10, 142, 7, 10, 47),
}
METHOD = re.compile(r'^\.method[^\n]* ([^\s]+)\n(.*?)^\.end method', re.M | re.S)
NONSTATIC = re.compile(r'invoke-(?:virtual|interface|super)(?:/range)? [^\n]*, (L[^\n]+)')
REFERENCE = re.compile(r'(?<![\w$])L[A-Za-z0-9_$/]+;->[^\s,\n]+')

NATIVE = {'hud': {'asset': 'EoRT8Q0n0KbLAu50',
         'sha256': '1c0c0d1eed55ac782dec2e67c5df9c161d08e3f83995e475a327239315374d03',
         'records': {'A1': [130705, 72],
                     'C1': [149052, 174],
                     'E1': [144737, 43],
                     'G1': [11245, 173],
                     'I1': [145818, 18],
                     'K1': [33389, 11],
                     'M1': [43939, 100],
                     'O1': [71039, 76],
                     'Q1': [47659, 80],
                     'S1': [169982, 3],
                     'Z': [165570, 104],
                     'ag9': [48487, 210],
                     'ax4': [84217, 173],
                     'bg9': [147156, 155],
                     'cg9': [52845, 131],
                     'dg9': [3548, 227],
                     'dr8': [121160, 127],
                     'eg9': [86278, 151],
                     'ek0': [135291, 203],
                     'eo': [475, 52],
                     'ew4': [4657, 251],
                     'fg9': [25259, 192],
                     'fk0': [67599, 146],
                     'mi3': [84047, 40],
                     'nk8': [159817, 4],
                     'of9': [44916, 75],
                     'q1': [46193, 23],
                     'qj0': [165903, 78],
                     'rg9': [25564, 148],
                     'rj0': [12431, 38],
                     's1': [82101, 50],
                     'sf9': [111083, 85],
                     'sj0': [56502, 59],
                     'sk8': [156106, 112],
                     'tf9': [145513, 62],
                     'tn': [152393, 150],
                     'tw4': [167117, 201],
                     'u1': [85205, 244],
                     'uf9': [171213, 246],
                     'uw4': [144681, 95],
                     'vf9': [17919, 144],
                     'vw4': [110161, 250],
                     'w1': [40316, 129],
                     'wf9': [31943, 112],
                     'x1': [3615, 182],
                     'xf9': [15432, 93],
                     'xw4': [51834, 55],
                     'yf9': [75618, 107],
                     'z1': [16268, 19],
                     'zf9': [36361, 238],
                     'java/lang/IllegalStateException': [40696, 205],
                     'nl/flitsmeister/features/hud/views/activities/HUDActivity$c': [74301, 93],
                     'nl/flitsmeister/fmcore/data/model/StringParam': [108238, 34],
                     'xf': [79801, 167],
                     'yxf': [149810, 8]}},
 'crop': {'asset': 'OayAk1B8xFetCqjZ',
          'sha256': '642dcce8b0473dec245f2fec49f1b5e8c04bc250bf609c65430b676bed90ae8c',
          'records': {'T1': [58945, 56],
                      'd2': [1416, 100],
                      'gb5': [53359, 32],
                      'hb5': [52032, 71],
                      'ib5': [72493, 62],
                      'lb5': [42090, 2],
                      'm2': [54726, 216],
                      'n2': [90475, 225],
                      'r1': [63506, 31],
                      's1': [39795, 185],
                      'x1': [92750, 252],
                      'android/content/Intent': [65384, 205],
                      'android/graphics/Bitmap': [28180, 177],
                      'android/graphics/PointF': [34738, 159],
                      'android/graphics/RectF': [53565, 10],
                      'fjk': [82567, 72]}},
 'cits': {'asset': 'b0w8vgPuA1eoFNTt',
          'sha256': '1af80ede201a6881d2a23ac5861feb31c84f2aaab8918423d0a954e5774c1c33',
          'records': {'cz2': [110307, 223],
                      'jz2': [146251, 206],
                      'kz2': [142992, 59],
                      'lz2': [4767, 64],
                      'mz2': [12681, 211],
                      'p1': [28364, 174],
                      'q1': [101016, 242],
                      'bemobile/cits/sdk/core/model/request/MonitoringAlert': [201627, 176],
                      'bemobile/cits/sdk/core/model/request/MonitoringEvent': [95652, 75],
                      'java/lang/Object': [68004, 67],
                      'java/lang/String': [151831, 80],
                      'java/lang/StringBuilder': [13914, 29],
                      'java/util/Map$Entry': [200673, 26],
                      'kotlin/Pair': [76176, 20],
                      'lf': [186971, 224],
                      'nl/flitsmeister/fmcore/models/data/destinations/Destination': [63874, 170]}},
 'insider': {'asset': 'WqKu6HXMirrJtgGO',
             'sha256': '765048b3452d48d772ab3cf5d8ec7903e9bbde2fede5a66cfafb510307e74f22',
             'records': {'bbl': [50703, 83]}}}

CALLBACKS = {'hud': [['Lfk0;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Luw4;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Lvw4;', '<init>(Ljava/lang/Object;I)V', 2, ['v1', 'p0', 'v10']],
         ['Leo;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Lsk8;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Lxw4;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Leg9;', '<init>(Ljava/lang/Object;I)V', 0, ['v1', 'p1', 'v10']],
         ['Lrg9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;Lsn4;)V',
          None,
          ['v9', 'p0', 'p1']],
         ['Lfg9;',
          '<init>(Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;I)V',
          0,
          ['v1', 'p0', 'v10']],
         ['Lmi3;', '<init>(Ljava/lang/Object;I)V', 4, ['v1', 'p0', 'v10']],
         ['Lax4;', '<init>(Ljava/lang/Object;I)V', 2, ['v1', 'p0', 'v10']],
         ['Ltn;', '<init>(Ljava/lang/Object;I)V', 3, ['v1', 'p0', 'v10']],
         ['Lbg9;',
          '<init>(Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;I)V',
          0,
          ['v1', 'p0', 'v10']],
         ['Lnk8;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Lcg9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v1', 'p0']],
         ['Lew4;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Ldg9;', '<init>(Ljava/lang/Object;I)V', 0, ['v1', 'p0', 'v10']],
         ['Ltw4;', '<init>(Ljava/lang/Object;I)V', 1, ['v1', 'p0', 'v10']],
         ['Lsf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v5', 'p0']],
         ['Lqj0;', '<init>(Landroid/view/KeyEvent$Callback;I)V', 1, ['v5', 'p0', 'v10']],
         ['Lrj0;', '<init>(Landroid/view/KeyEvent$Callback;I)V', 1, ['v5', 'p0', 'v10']],
         ['Lsj0;', '<init>(Landroid/view/KeyEvent$Callback;I)V', 1, ['v5', 'p0', 'v10']],
         ['Luf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v5', 'p0']],
         ['Lwf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v5', 'p0']],
         ['Lxf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v6', 'p0']],
         ['Lyf9;', '<init>(Landroid/view/KeyEvent$Callback;I)V', 0, ['v6', 'p0', 'v10']],
         ['Lzf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v5', 'p0']],
         ['Lag9;',
          '<init>(Landroidx/viewbinding/ViewBinding;Landroid/content/Context;I)V',
          0,
          ['v5', 'v0', 'p0', 'v10']],
         ['Ltf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v1', 'p0']],
         ['Lek0;', '<init>(Ljava/lang/Object;I)V', 2, ['p1', 'v1', 'v10']],
         ['Lof9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v0', 'p0']],
         ['Lvf9;',
          '<init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V',
          None,
          ['v0', 'p0']]],
 'crop': [['Lgb5;', '<init>(Ljava/lang/Object;I)V', 0, ['v0', 'p0', 'v12']],
          ['Lhb5;', '<init>(Ljava/lang/Object;I)V', 0, ['v0', 'p0', 'v12']],
          ['Lib5;', '<init>(Ljava/lang/Object;I)V', 0, ['p1', 'p0', 'v12']]],
 'cits': [['Llz2;', '<init>(Ljava/lang/Object;I)V', 0, ['v3', 'v1', 'v6']],
          ['Lkz2;', '<init>(Ljava/lang/Object;I)V', 0, ['v3', 'v0', 'v6']],
          ['Ljz2;',
           '<init>(Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;)V',
           None,
           ['v3', 'v1']],
          ['Lmz2;', '<init>(Ljava/lang/Object;I)V', 0, ['v2', 'v1', 'v6']]],
 'insider': []}

CALLBACK_METHODS = {'Lfk0;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '04a980d9d565462ee8c2d74aed8537851c9a486d6d8fe016c95d62a81cb67984'},
 'Luw4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '0e023d2dc29fa9413c795edd33d54e27ab4bf7d421ea23565629dc4406156478'},
 'Lvw4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '895b0fdd3d7691f172f97430bc4ebe41e0fd433a043bce2f73e7a3b2dd5e0886'},
 'Leo;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '40ff46794222432eb71e6a021674119c19cb78e64907d497f76b1dfbf0686959'},
 'Lsk8;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'c16d79805d882a769eadfa35b1c1675e0d190179f7737d6e0b50f042d3a9d72f'},
 'Lxw4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '36ca39483f9d54cc5a71d12c68ae362fc3165b5eed493e3f1564eef15f8b2579'},
 'Leg9;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'e1a0c719f40fb3f068a0b239e396de5803850f87569dc9eae0e77590993b1f43'},
 'Lrg9;': {'create(Ljava/lang/Object;Lsn4;)Lsn4;': '4618987fb6bae818ebef9dc36447f955dd163d5c3d99cdcbcad968e47869cc15',
           'invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': '030da02500e6e3c9ce38bf6dcfba1d0ca88ef9f7c50bd224a1848977a1882610',
           'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;': 'b42aa8a1b808baaa2ea6c21fc50ce38f879a5fe71e6a6e292b0ae3233443d56f'},
 'Lfg9;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '94052e88f1b381952b5c02a1787c1c0684d181888ddaef6a581f290537fa2bd8'},
 'Lmi3;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '95d4378b40cce0fb537eef0658f4030bb370a4c8379492c8332ca4649917726c'},
 'Lax4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '84dc7d9a1579d15c46155386db99c95d841a4cb93e1f5be76078177f60a7abad'},
 'Ltn;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '1256ddef6aafa1b195c2350f2c90333a0f22a470fbb098d15623bdde366b8eef'},
 'Lbg9;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '8b173dea8e1c3b5e764c32760f925103aff93c9ed1e097ce83d11d4064659a1b'},
 'Lnk8;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '6d3d43f66ee535a75432863424deaccd9299982842ddfc5c59c2dbe33fc3c53d'},
 'Lcg9;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'ab3f1560a816384b29072d3b900228ee00733a6fe8a446cfd4cb017afecd174f'},
 'Lew4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'cb026562f8c5c42c72f834a2277e8eb88501b629d80f7d68e7e8214aea32761b'},
 'Ldg9;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'ec710acc39fe937bc1ca264e8902655c2bedfee85c1eae857f31713cdf572745'},
 'Ltw4;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': '3e4605e591fc04d21c7bf0013010b4223d01b68a65eced1544b6472d78aa7ca5'},
 'Lsf9;': {'onClick(Landroid/view/View;)V': '3fdd308fc10f09598f9fb73b966e28c2c17b83cb190a45eaa59f612c0fd30dd7'},
 'Lqj0;': {'onClick(Landroid/view/View;)V': '178774611dd84f2354b8071e485d0bd32bde216cc119952a216dc8a745fb2eec'},
 'Lrj0;': {'onClick(Landroid/view/View;)V': 'f1ba7e51df2f3c49751f127cc780fc25c34b2a8776647bbb17cb7aea582ac867'},
 'Lsj0;': {'onClick(Landroid/view/View;)V': '25fd72bcd078497e4ad418badc4fe9ea02d6116c294f69f0871b6ceb59124088'},
 'Luf9;': {'onClick(Landroid/view/View;)V': '04b2fdf3ea7e782b3b3979d6188f4b33ba85cde3fad79e0ddf6848d9e9bb93ca'},
 'Lwf9;': {'onClick(Landroid/view/View;)V': '0af7e9c426ab735d1a863792ae76b0f5a5e4a250446ea9db9d8f1d7c70c4475d'},
 'Lxf9;': {'onClick(Landroid/view/View;)V': 'ce7dfb93b2d7fa339f5ae055c54bb5b421ec0a74f0fbbfa4979daddf3bbbe40b'},
 'Lyf9;': {'onClick(Landroid/view/View;)V': '2f8bb8a1198182ac9bc4060f024a05743a6e469f10d6cce307891038754434f7'},
 'Lzf9;': {'onClick(Landroid/view/View;)V': '16c09c2ef741e39f8430737977c6cc772d46740c597f05ae6bba66a61f90ddf4'},
 'Lag9;': {'invoke()Ljava/lang/Object;': '5c0a717f4ea3a52a8be9562f052fe5ee8aaef606ce2418458f41f22e8ad20223'},
 'Ltf9;': {'onClick(Landroid/view/View;)V': '9bf0f589b43695e7600f36814b1fae7ecde6ec429352c7a548e3e57ebdeabd15'},
 'Lof9;': {'run()V': 'caefdfa37a2f4a7de5123bb0d5c1716da8f13c9c434a49143b071cbab1851e9f'},
 'Lvf9;': {'invoke()Ljava/lang/Object;': '458f5ebf39be3f9a299206c82d690a717efaa4ac03ff191c349549468a73ff11'},
 'Lek0;': {'invoke(Ljava/lang/Object;)Ljava/lang/Object;': 'b67cd672e4532859594d3c20e5e0fd396d25ee79532d7b78e65b3f9957062191'},
 'Lgb5;': {'onClick(Landroid/view/View;)V': '2ba84d74d37557bbeacee0c001b97ca87b335d00ed71e1351d09a40db14afc92'},
 'Lhb5;': {'onClick(Landroid/view/View;)V': 'fc1825a3e42e3336deebfab195e47eb0bb401710c78484efc733f857a89d985c'},
 'Lib5;': {'invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': 'fb155e10062481f69c75d6f428e56178170d50a4084bdfbf0c3fe6a4e689ddf9'},
 'Llb5;': {'a()V': '046a3a617799b7411b77000d4176f5619fbf0fbaf7fb05116ff1b402de2ccdaa',
           'b(F)V': '5ea1110cff2e24c9884c589cb9aee8ed2c9163e8b8f3fe4fcdf244cb8fca23b0',
           'c()V': '682f1be8b7efaced2ef4e982cade1154dbbbd9253d0d5044af89cd4439f1d38f'},
 'Llz2;': {'onClick(Landroid/view/View;)V': 'a5f9d863ad99897565a9e323ad6d43f72c4a7fe57ab6df3e69332f8374ccc689'},
 'Lkz2;': {'onClick(Landroid/view/View;)V': 'ca88653a9040b4ce4919e167d740560df6dfc28a119880089be28cbdcb1821a5'},
 'Ljz2;': {'onClick(Landroid/view/View;)V': '149fc62e6ae8c9e390b4587318bd6fd673227e1166c43388accd12c51d64409e'},
 'Lmz2;': {'onClick(Landroid/view/View;)V': 'a5138a3461ed68703bbefe9883c47b11a296fd880ba67a9f71b67a0b3ab2698c'}}

FIELD_REFERENCES = {'hud': ['Landroidx/activity/SystemBarStyle;->Companion:Landroidx/activity/SystemBarStyle$Companion;',
         'Lii9;->x1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->E1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->M1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->I1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->K1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->Z:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->A1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->X:Li6f;',
         'Landroidx/lifecycle/Lifecycle$Event;->ON_START:Landroidx/lifecycle/Lifecycle$Event;',
         'Landroidx/lifecycle/Lifecycle$Event;->ON_STOP:Landroidx/lifecycle/Lifecycle$Event;',
         'Lii9;->s1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->u1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->O1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->w1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->q1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->C1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->G1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->z1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->Q1:Landroidx/lifecycle/MutableLiveData;',
         'Lii9;->S1:Landroidx/lifecycle/MutableLiveData;',
         'Lxf;->s:Landroid/widget/TextView;',
         'Lxf;->y:Landroid/widget/TextView;',
         'Lxf;->r1:Landroid/widget/TextView;',
         'Lxf;->Y:Landroid/widget/TextView;',
         'Lxf;->I:Landroid/widget/TextView;',
         'Lxf;->X:Landroid/widget/TextView;',
         'Lxf;->x:Lcjk;',
         'Lcjk;->y:Landroid/widget/ImageButton;',
         'Lcjk;->I:Landroid/widget/ImageButton;',
         'Lcjk;->d:Lnl/flitsmeister/fmcore/views/button/MultiButton;',
         'Lxf;->q1:Lnl/flitsmeister/features/hud/views/custom/HUDToastView;',
         'Lnl/flitsmeister/features/hud/views/custom/HUDToastView;->I:Lag9;',
         'Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;',
         'Lvug;->p:I',
         'Lvug;->p:I',
         'Lvug;->q:J',
         'Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->u1:Llob;',
         'Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;',
         'Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;'],
 'crop': ['Lfjk;->b:Landroid/widget/LinearLayout;',
          'Lfjk;->c:Lcom/isseiaoki/simplecropview/CropImageView;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->n2:I',
          'Lcom/isseiaoki/simplecropview/CropImageView$a;->d:Lcom/isseiaoki/simplecropview/CropImageView$a;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->T1:Lcom/isseiaoki/simplecropview/CropImageView$a;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->d2:Landroid/graphics/PointF;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->x1:Z',
          'Lkek;->a:Landroid/animation/ValueAnimator;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->r1:Landroid/graphics/RectF;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;',
          'Landroid/graphics/RectF;->left:F',
          'Landroid/graphics/RectF;->left:F',
          'Landroid/graphics/RectF;->top:F',
          'Landroid/graphics/RectF;->top:F',
          'Landroid/graphics/RectF;->right:F',
          'Landroid/graphics/RectF;->right:F',
          'Landroid/graphics/RectF;->bottom:F',
          'Landroid/graphics/RectF;->bottom:F',
          'Lcom/isseiaoki/simplecropview/CropImageView;->m2:Z',
          'Lkek;->b:Li2i;',
          'Lkek;->a:Landroid/animation/ValueAnimator;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;',
          'Lcom/isseiaoki/simplecropview/CropImageView;->r1:Landroid/graphics/RectF;',
          'Lfjk;->q:Landroid/widget/ImageButton;',
          'Lfjk;->d:Landroidx/appcompat/widget/AppCompatButton;',
          'Lfjk;->s:Landroidx/compose/ui/platform/ComposeView;',
          'Landroidx/compose/ui/platform/ViewCompositionStrategy$DisposeOnViewTreeLifecycleDestroyed;->INSTANCE:Landroidx/compose/ui/platform/ViewCompositionStrategy$DisposeOnViewTreeLifecycleDestroyed;'],
 'cits': ['Llf;->s1:Landroid/widget/LinearLayout;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Lrz2;->a:Lrz2;',
          'Lxc0;->V:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;',
          'Lxc0;->W:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;',
          'Lxc0;->X:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;',
          'Llf;->s:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->q1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Llf;->p1:Landroid/widget/TextView;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Llf;->I:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Llf;->x1:Landroid/widget/LinearLayout;',
          'Llf;->o1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->Y:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->w1:Landroid/widget/LinearLayout;',
          'Llf;->t1:Landroid/widget/LinearLayout;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Llf;->r1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->X:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->Z:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;',
          'Llf;->y1:Landroid/view/View;',
          'Llf;->v1:Landroid/view/View;',
          'Llf;->d:Landroid/view/View;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->q1:Lnl/flitsmeister/fmcore/models/data/destinations/Destination;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->q1:Lnl/flitsmeister/fmcore/models/data/destinations/Destination;',
          'Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;->PARKING_DETAILS:Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;',
          'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;',
          'Lnza;->b:Landroid/location/Location;',
          'Ln37;->a:Lre6;',
          'Llf;->y:Landroid/widget/TextView;',
          'Llf;->x:Landroid/widget/TextView;',
          'Llf;->c:Landroidx/appcompat/widget/AppCompatButton;',
          'Llf;->b:Landroidx/appcompat/widget/AppCompatButton;'],
 'insider': ['Lbbl;->a:Landroid/content/Context;',
             'Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;',
             'Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;',
             'Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;',
             'Lhdl;->c:Ljava/util/regex/Pattern;',
             'Lhdl;->a:Ljava/util/regex/Pattern;',
             'Lhdl;->b:Ljava/util/regex/Pattern;',
             'Ldlc;->a:Ljava/lang/String;',
             'Ldlc;->c:Ljava/lang/String;',
             'Ldlc;->d:Ljava/lang/String;',
             'Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;']}

# Preserve all 96 typed operations, including registers and array operands.
# Each exact JNI class name is independently present in its protected asset.
TYPE_OPERATIONS = {'hud': ['check-cast p1, Lxf;',
         'new-instance v1, Lfk0;',
         'new-instance v3, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Luw4;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lvw4;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Leo;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lsk8;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lxw4;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Leg9;',
         'new-instance p1, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v9, Lrg9;',
         'new-instance v4, Ldr8;',
         'new-instance v1, Lfg9;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lmi3;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lax4;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Ltn;',
         'new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lbg9;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lnk8;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lcg9;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Lew4;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Ldg9;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'new-instance v1, Ltw4;',
         'new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity$c;',
         'check-cast v0, Lxf;',
         'new-instance v5, Lsf9;',
         'new-instance v5, Lqj0;',
         'new-instance v5, Lrj0;',
         'new-instance v5, Lsj0;',
         'new-instance v5, Luf9;',
         'new-instance v5, Lwf9;',
         'new-instance v6, Lxf9;',
         'new-instance v6, Lyf9;',
         'new-instance v5, Lzf9;',
         'new-instance v5, Lag9;',
         'new-instance v1, Ltf9;',
         'const-class v1, Lyxf;',
         'check-cast v1, Lyxf;',
         'new-instance v2, Lnl/flitsmeister/fmcore/data/model/StringParam;',
         'new-instance v1, Lnl/flitsmeister/fmcore/data/model/StringParam;',
         'filled-new-array {v2, v1}, [Lnl/flitsmeister/fmcore/data/model/StringParam;',
         'new-instance v0, Ljava/lang/IllegalStateException;',
         'new-instance p1, Lek0;',
         'check-cast p1, Lxf;',
         'new-instance v0, Lof9;',
         'check-cast p1, Lxf;',
         'new-instance v0, Lvf9;'],
 'crop': ['check-cast p1, Lfjk;',
          'check-cast p1, Landroid/content/Intent;',
          'instance-of v0, p1, Landroid/graphics/Bitmap;',
          'check-cast v3, Landroid/graphics/Bitmap;',
          'check-cast p1, Lfjk;',
          'new-instance v0, Landroid/graphics/PointF;',
          'new-instance v6, Landroid/graphics/RectF;',
          'new-instance v4, Llb5;',
          'check-cast p1, Lfjk;',
          'new-instance v0, Lgb5;',
          'check-cast p1, Lfjk;',
          'new-instance v0, Lhb5;',
          'check-cast p0, Lfjk;',
          'new-instance p1, Lib5;'],
 'cits': ['check-cast v0, Llf;',
          'check-cast v0, Llf;',
          'check-cast v9, Llf;',
          'new-instance v12, Ljava/lang/StringBuilder;',
          'filled-new-array {v0}, [Ljava/lang/Object;',
          'check-cast v0, Llf;',
          'check-cast v15, Ljava/util/Map$Entry;',
          'check-cast v4, Ljava/lang/String;',
          'check-cast v15, Ljava/lang/String;',
          'new-instance v8, Ljava/lang/StringBuilder;',
          'new-instance v5, Ljava/lang/StringBuilder;',
          'new-instance v0, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;',
          'new-instance v3, Lbemobile/cits/sdk/core/model/request/MonitoringEvent;',
          'new-instance v4, Lbemobile/cits/sdk/core/model/request/MonitoringAlert;',
          'new-instance v0, Lkotlin/Pair;',
          'new-instance v0, Lcz2;',
          'check-cast v0, Llf;',
          'new-instance v3, Llz2;',
          'new-instance v3, Lkz2;',
          'new-instance v3, Ljz2;',
          'new-instance v2, Lmz2;'],
 'insider': ['check-cast p1, Lbbl;']}

BINDING_FACTORIES = {'hud': ('Lxf;',
         ['v4', 'p0', 'p0', 'p0', 'p0', 'p0'],
         '0x7f0d0024',
         '6d2766f98c5de33fc03d6241c2d8706c501872fe6b6402e6db196b8938faa00a'),
 'crop': ('Lfjk;',
          ['v3', 'v2'],
          '0x7f0d0174',
          '4a284a6fd0ad012a7b179730457dee2659419dddb0ada68a50436aecd600728c'),
 'cits': ('Llf;',
          ['v4', 'v3', 'v3'],
          '0x7f0d001f',
          '499b2ade0d2b9fc2f91b0c568f462c78395d83ff08bfc1c7555d7b6cf2a0d350')}

def instructions(body):
    return [line.strip() for line in body.splitlines()
            if line.strip() and line.strip()[0] not in '.:#']


def verify(decoded, source=SOURCE):
    text = source.read_text()
    cache = {}

    def class_text(cls):
        if cls not in cache:
            paths = list(decoded.glob('smali*/' + cls[1:-1] + '.smali'))
            assert len(paths) <= 1, f'Ambiguous publisher class {cls}'
            cache[cls] = paths[0].read_text() if paths else None
        return cache[cls]

    def member_exists(cls, signature, seen=()):
        if cls in seen:
            return False
        value = class_text(cls)
        if value is None:
            return False
        kind = 'method' if '(' in signature else 'field'
        if re.search(r'^\.' + kind + r'[^\n]* ' + re.escape(signature) + r'(?:\s|$)', value, re.M):
            return True
        if signature.startswith('<init>'):
            return False
        return any(member_exists(parent, signature, seen + (cls,))
                   for parent in re.findall(r'^\.(?:super|implements) (L[^;]+;)', value, re.M))

    for cls, expected_methods in CALLBACK_METHODS.items():
        actual = dict(METHOD.findall(class_text(cls)))
        for signature, expected in expected_methods.items():
            assert hashlib.sha256(actual[signature].encode()).hexdigest() == expected, f'Changed callback behavior {cls}->{signature}'

    key_data = (decoded / 'assets/Fxz6YV9Xh1xFSXmr').read_bytes()[0x2026C:0x2036C]
    assert hashlib.sha256(key_data).hexdigest() == '576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1'
    # The base class stores the virtual y() factory result and x() returns it.
    # Check this chain and the concrete factory allocation/return rather than
    # accepting an arbitrary existing ViewBinding class at a cast site.
    base = 'Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;'
    base_methods = dict(METHOD.findall(class_text(base)))
    assert ('invoke-virtual {p0}, ' + base + '->y()Landroidx/viewbinding/ViewBinding;\n\n'
            '    move-result-object p1\n\n'
            '    iput-object p1, p0, ' + base + '->Z:Landroidx/viewbinding/ViewBinding;') in base_methods['onCreate(Landroid/os/Bundle;)V']
    assert ('iget-object p0, p0, ' + base + '->Z:Landroidx/viewbinding/ViewBinding;') in base_methods['x()Landroidx/viewbinding/ViewBinding;']
    assert 'return-object p0' in base_methods['x()Landroidx/viewbinding/ViewBinding;']
    for name, (binding, returns, layout, expected_hash) in BINDING_FACTORIES.items():
        owner = 'L' + PROFILES[name][1] + ';'
        factory = dict(METHOD.findall(class_text(owner)))['y()Landroidx/viewbinding/ViewBinding;']
        assert hashlib.sha256(factory.encode()).hexdigest() == expected_hash, f'Changed {name} binding factory'
        assert re.findall(r'return-object (\w+)', factory) == returns
        assert layout in factory
        for register in returns[:1]:
            assert f'new-instance {register}, {binding}' in factory
            assert re.search(r'invoke-direct(?:/range)? \{' + register + r'(?: \.\.|,)[^}]*\}, ' + re.escape(binding) + r'-><init>\(', factory)
        # Remaining apparent returns follow the real always-throw helper.
        assert len(re.findall(r'invoke-static \{\w+\}, Ltnf;->a\(Ljava/lang/String;\)V\s+return-object \w+', factory)) == len(returns) - 1
        assert '.implements Landroidx/viewbinding/ViewBinding;' in class_text(binding)
    throwing = dict(METHOD.findall(class_text('Ltnf;')))['a(Ljava/lang/String;)V']
    assert instructions(throwing) == ['new-instance v0, Ljava/lang/NullPointerException;', 'invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V', 'throw v0']

    # Insider resolves mal through the registered supplier, which constructs
    # bbl. The protected cast must agree with the actual unprotected provider.
    sdk = dict(METHOD.findall(class_text('Lcdl;')))
    assert ('new-instance v2, Ll;\n\n'
            '    invoke-direct {v2}, Ljava/lang/Object;-><init>()V\n\n'
            '    const-class v3, Lmal;\n\n'
            '    invoke-virtual {v1, v2, v3}, Lcdl;->c(Landroidx/core/util/Supplier;Ljava/lang/Class;)V') in sdk['h()Lcdl;']
    assert 'const-class v0, Lmal;' in sdk['f()Lmal;']
    supplier = dict(METHOD.findall(class_text('Ll;')))['get()Ljava/lang/Object;']
    assert instructions(supplier) == ['new-instance p0, Lbbl;', 'invoke-direct {p0}, Lbbl;-><init>()V', 'return-object p0']
    assert '.implements Lmal;' in class_text('Lbbl;')

    references = set()
    restored = {}
    for name, (symbol, owner, signature, registers, count, old_registers, old_count, call_count) in PROFILES.items():
        match = re.search(r'internal val ' + symbol + r'15 = """\n(.*?)\n"""', text, re.S)
        assert match, f'Missing {symbol}'
        body = '\n'.join(line.strip() for line in match[1].replace("${'$'}", '$').splitlines())
        restored[name] = body
        typed = [line for line in instructions(body) if re.match(
            r'(?:check-cast|new-instance|const-class|instance-of|filled-new-array)\b', line)]
        assert typed == TYPE_OPERATIONS[name], f'Changed {name} native type operation/register contract'
        native_classes = {cls[1:-1] for line in typed for cls in re.findall(r'L[\w/$]+;', line)}
        assert native_classes <= NATIVE[name]['records'].keys(), f'Unbound {name} native type operand'
        assert f'{symbol}RegisterCount15 = {registers}' in text
        assert len(instructions(body)) == count, f'Changed {name} instruction count'
        assert 'Lcom/pairip/VMRunner;' not in body
        publisher = class_text('L' + owner + ';')
        methods = dict(METHOD.findall(publisher))
        wrapper = methods[signature]
        parameter_count = 1 if name == 'cits' else 2
        assert int(re.search(r'\.locals (\d+)', wrapper)[1]) + parameter_count == old_registers
        assert len(instructions(wrapper)) == old_count
        assert re.findall(r'const-string(?:/jumbo)? \w+, "([^"\n]+)"', wrapper) == [NATIVE[name]['asset']]
        assert len(re.findall(r'^\s*\.catch', wrapper, re.M)) == 0

        calls = NONSTATIC.findall(body)
        assert len(calls) == call_count
        delegates = {}
        for sig, code in methods.items():
            ordinal = re.search(r'\$(\d{3})\(', sig)
            if not ordinal:
                continue
            actual = NONSTATIC.findall(code)
            assert len(actual) == 1, f'Changed synthetic delegate {sig}'
            delegates[int(ordinal[1])] = actual[0]
        assert sorted(delegates) == list(range(1, call_count + 1))
        assert calls == [delegates[i] for i in range(1, call_count + 1)], f'Changed {name} ordered invocation contracts'

        # Verify the exact constructor targets, captures and selected merged
        # branch. A correct class with the wrong discriminator is not accepted.
        callback_sites = []
        constants = {}
        for line in instructions(body):
            c = re.match(r'const(?:/4|/16)? (\w+), (-?0x[0-9a-f]+)$', line)
            if c:
                constants[c[1]] = int(c[2], 16)
            call = re.match(r'invoke-direct \{([^}]+)\}, (L[^;]+;)->(<init>[^\n]+)', line)
            if call and call[2] in CALLBACK_METHODS:
                args = call[1].split(', ')
                selected = constants.get(args[-1]) if call[3].endswith('I)V') else None
                callback_sites.append([call[2], call[3], selected, args])
            if not line.startswith(('const', 'invoke-', 'if-', 'goto', 'iput', 'sput', 'return', 'throw', 'monitor')):
                destination = re.match(r'\S+ ([vp]\d+)', line)
                if destination:
                    constants.pop(destination[1], None)
        assert callback_sites == CALLBACKS[name], f'Changed {name} callback branch/capture contract'
        assert [r for r in REFERENCE.findall(body) if ':' in r and '(' not in r] == FIELD_REFERENCES[name], f'Changed {name} field identity/order contract'

        for reference in REFERENCE.findall(body):
            cls, sig = reference.split('->')
            external = class_text(cls) is None and cls.startswith(('Ljava/', 'Landroid/', 'Lorg/slf4j/'))
            assert external or member_exists(cls, sig), f'Unresolved publisher member: {reference}'
            references.add(reference)

        record = NATIVE[name]
        data = (decoded / 'assets' / record['asset']).read_bytes()
        assert hashlib.sha256(data).hexdigest() == record['sha256'], f'Changed protected asset {name}'
        for expected, (offset, phase) in record['records'].items():
            size = (data[offset] ^ key_data[phase]) | ((data[offset + 1] ^ key_data[(phase + 1) % 256]) << 8)
            value = bytes(data[offset + i] ^ key_data[(phase + i) % 256] for i in range(2, size + 2))
            assert value == expected.encode(), f'Changed native binding {name}:{offset:x}'

    assert '.catch Ljava/io/IOException;' in restored['crop']
    assert '.catch Ljava/lang/Exception;' in restored['insider']
    assert '.catch' not in restored['hud'] and '.catch' not in restored['cits']
    assert 'Landroid/provider/MediaStore$Images$Media;->getBitmap' in restored['crop']
    assert 'Landroid/app/Activity;->setResult(I)V' in restored['crop']
    assert 'Landroid/app/Activity;->finish()V' in restored['crop']
    assert '"focus_mode_started"' in restored['hud']
    assert 'Lnl/flitsmeister/features/hud/views/custom/HUDToastView;->I:Lag9;' in restored['hud']
    assert '->observe(' in restored['hud'] and '->postDelayed(' in restored['hud']
    assert 'Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;' in restored['cits']
    assert 'Lcom/useinsider/insider/Insider;->putException' in restored['insider']
    return {'activities': len(PROFILES), 'ordered_calls': sum(p[-1] for p in PROFILES.values()),
            'resolved_references': len(references),
            'native_bindings': sum(len(v['records']) for v in NATIVE.values()),
            'type_operations': sum(map(len, TYPE_OPERATIONS.values()))}


def negative_controls(decoded, source=SOURCE):
    """Reject mutations of real existing classes without changing production."""
    import tempfile

    original = source.read_text()
    # Both classes have this exact constructor, so constructor signature and
    # member-existence checks alone cannot identify the allocation mutation.
    prototype = '<init>(Ljava/lang/Object;I)V'
    for cls in ('fk0', 'uw4'):
        publisher = next(decoded.glob('smali*/' + cls + '.smali')).read_text()
        assert prototype in dict(METHOD.findall(publisher))
    controls = {
        'existing_wrong_binding_cast': ('check-cast p1, Lxf;', 'check-cast p1, Llf;'),
        'existing_same_constructor_allocation': ('new-instance v1, Lfk0;', 'new-instance v1, Luw4;'),
        'wrong_type_register': ('check-cast p1, Lxf;', 'check-cast v0, Lxf;'),
    }
    for name, (before, after) in controls.items():
        assert before in original, f'Missing negative-control site {name}'
        with tempfile.NamedTemporaryFile(mode='w', suffix='.kt') as candidate:
            candidate.write(original.replace(before, after, 1))
            candidate.flush()
            try:
                verify(decoded, Path(candidate.name))
            except AssertionError as error:
                assert 'native type operation/register contract' in str(error), (name, str(error))
            else:
                raise AssertionError(f'Accepted invalid type operation: {name}')
    return len(controls)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--source', type=Path, default=SOURCE)
    parser.add_argument('--negative-controls', action='store_true')
    args = parser.parse_args()
    result = verify(args.decoded, args.source)
    if args.negative_controls:
        result['negative_controls'] = negative_controls(args.decoded, args.source)
    print(result)
