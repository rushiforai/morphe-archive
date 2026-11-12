.class public Lua7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljzh;
.implements Lf94;
.implements Let8;
.implements Lrya;
.implements Lx6f;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 5

    iput-byte p1, p0, Lua7;->a:B

    packed-switch p1, :pswitch_data_32

    const/16 p1, 0xa

    .line 190
    new-array v0, p1, [J

    new-array v1, p1, [J

    new-array p1, p1, [J

    const/4 v2, 0x4

    invoke-direct {p0, v0, v1, p1, v2}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-void

    .line 191
    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    new-instance p1, Lg3d;

    .line 193
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 194
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 195
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void

    .line 196
    :pswitch_20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    new-instance p1, Lode;

    .line 198
    invoke-direct {p1}, Lekc;-><init>()V

    .line 199
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 200
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    return-void

    :pswitch_data_32
    .packed-switch 0x14
        :pswitch_20
        :pswitch_12
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 225
    iput-byte p1, p0, Lua7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/16 v0, 0x1c

    iput-byte v0, p0, Lua7;->a:B

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Lii;

    const/16 v1, 0x13

    .line 154
    invoke-direct {v0, v1}, Lii;-><init>(B)V

    .line 155
    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 156
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 157
    new-instance v0, Lni6;

    invoke-direct {v0, p1}, Lni6;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lws4;Lcm;)V
    .registers 7

    const/16 v0, 0x1d

    iput-byte v0, p0, Lua7;->a:B

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_12

    .line 177
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 178
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 179
    invoke-virtual {p3, v0, v1}, Lws4;->c(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 180
    :cond_12
    new-instance p3, Ll1f;

    invoke-direct {p3, p1, p2}, Ll1f;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p3, p0, Lua7;->b:Ljava/lang/Object;

    .line 181
    iput-object p4, p0, Lua7;->c:Ljava/lang/Object;

    .line 182
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lqy7;Landroid/view/View;)V
    .registers 5

    const/4 v0, 0x6

    iput-byte v0, p0, Lua7;->a:B

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 136
    iput-object p3, p0, Lua7;->c:Ljava/lang/Object;

    .line 137
    new-instance p1, Landroid/widget/PopupWindow;

    const/4 p3, -0x2

    const/4 v0, 0x0

    invoke-direct {p1, p2, p3, p3, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwu5;)V
    .registers 3

    const/16 p2, 0xf

    iput-byte p2, p0, Lua7;->a:B

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    new-instance p2, Ljava/util/ArrayList;

    .line 213
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    .line 214
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p2}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object p2

    iput-object p2, p0, Lua7;->d:Ljava/lang/Object;

    .line 215
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContextWrapper;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lua7;->a:B

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lua7;->b:Ljava/lang/Object;

    .line 123
    sget-object v0, Lap7;->a:Lap7;

    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 124
    new-instance v0, Lzo7;

    invoke-direct {v0}, Lzo7;-><init>()V

    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    .line 125
    instance-of v0, p1, Lxd5;

    if-eqz v0, :cond_1e

    check-cast p1, Lxd5;

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    invoke-virtual {p0, p1}, Lua7;->C(Lxd5;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/ParcelFileDescriptor;Ljava/util/ArrayList;Ljl6;)V
    .registers 5

    const/16 v0, 0x11

    iput-byte v0, p0, Lua7;->a:B

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput-object p3, p0, Lua7;->b:Ljava/lang/Object;

    .line 203
    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    .line 204
    new-instance p2, Lwub;

    invoke-direct {p2, p1}, Lwub;-><init>(Landroid/os/ParcelFileDescriptor;)V

    iput-object p2, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)V
    .registers 8

    const/16 v0, 0x10

    iput-byte v0, p0, Lua7;->a:B

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f0a04e8

    .line 159
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lua7;->b:Ljava/lang/Object;

    const v0, 0x7f0a069d

    .line 160
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 161
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 162
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    const v0, 0x7f0a095a

    .line 163
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 164
    invoke-virtual {v0, p4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 165
    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 166
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 167
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f08024e

    .line 168
    invoke-static {p1, p3}, Lg8;->q(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 169
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    .line 170
    div-int/lit8 p1, p1, 0x2

    invoke-virtual {v0, p1}, Landroid/widget/AbsSeekBar;->setThumbOffset(I)V

    .line 171
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V
    .registers 5

    const/16 v0, 0xc

    iput-byte v0, p0, Lua7;->a:B

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 128
    new-instance p1, Lzg;

    .line 129
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 130
    iput v0, p1, Lzg;->a:I

    .line 131
    iput-object p3, p1, Lzg;->b:Ljava/lang/Object;

    .line 132
    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    .line 133
    new-array p1, p2, [Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;Lgjm;)V
    .registers 4

    const/16 v0, 0xd

    iput-byte v0, p0, Lua7;->a:B

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 100
    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lesg;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lua7;->a:B

    .line 209
    invoke-direct {p0, v0}, Lua7;-><init>(B)V

    .line 210
    invoke-static {p0, p1}, Lua7;->t(Lua7;Lesg;)V

    return-void
.end method

.method public constructor <init>(Lf38;Lzlj;Lr38;)V
    .registers 5

    const/4 v0, 0x7

    iput-byte v0, p0, Lua7;->a:B

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    .line 223
    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    .line 224
    iput-object p3, p0, Lua7;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 96
    iput-byte p4, p0, Lua7;->a:B

    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    iput-object p3, p0, Lua7;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V
    .registers 6

    .line 97
    iput-byte p5, p0, Lua7;->a:B

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    iput-object p2, p0, Lua7;->b:Ljava/lang/Object;

    iput-object p3, p0, Lua7;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5

    const/16 v0, 0x1a

    iput-byte v0, p0, Lua7;->a:B

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    new-instance v0, Lx77;

    const/16 v1, 0x19

    const/4 v2, 0x0

    .line 218
    invoke-direct {v0, v1, v2}, Lx77;-><init>(BZ)V

    .line 219
    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 220
    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    .line 221
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 6

    const/16 v0, 0x16

    iput-byte v0, p0, Lua7;->a:B

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lua7;->b:Ljava/lang/Object;

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 111
    :goto_20
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_54

    .line 112
    iget-object v1, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lccd;

    .line 113
    iget-object v2, v2, Lccd;->b:Ldd1;

    .line 114
    new-instance v3, Ldbj;

    .line 115
    iget-object v2, v2, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    .line 116
    invoke-direct {v3, v2}, Ldbj;-><init>(Ljava/util/List;)V

    .line 117
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lccd;

    .line 119
    iget-object v1, v1, Lccd;->c:Ldd1;

    .line 120
    iget-object v2, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ldd1;->D()La73;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_54
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lb9e;)V
    .registers 8

    const/16 v0, 0x13

    iput-byte v0, p0, Lua7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    sget-object p2, Loz9;->a:Ld06;

    iget-object p2, p2, Ld06;->a:Ljava/lang/Object;

    check-cast p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_5d

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    :cond_22
    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqwb;

    iget v3, v2, Lqwb;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_47

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-boolean v2, v2, Lqwb;->e:Z

    if-eqz v2, :cond_22

    const/4 v1, 0x1

    goto :goto_22

    :cond_47
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string p1, "KeyID "

    const-string p2, " is duplicated in the keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing."

    invoke-static {v3, p1, p2}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_55
    if-nez v1, :cond_5d

    const-string p0, "Primary key id not found in keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    throw v0

    :cond_5d
    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnkj;)V
    .registers 3

    const/16 v0, 0x15

    iput-byte v0, p0, Lua7;->a:B

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    new-instance v0, Lg3d;

    .line 140
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v0, p0, Lua7;->b:Ljava/lang/Object;

    .line 142
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnwf;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    const/16 v0, 0x1b

    iput-byte v0, p0, Lua7;->a:B

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 145
    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    .line 146
    iput-object p3, p0, Lua7;->d:Ljava/lang/Object;

    .line 147
    new-instance p1, Luje;

    invoke-direct {p1, p0}, Luje;-><init>(Lua7;)V

    .line 148
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 150
    invoke-virtual {p3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    invoke-virtual {p3, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public constructor <init>(Lrf7;Lumi;Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lua7;->a:B

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    sput-object p0, Lx1p;->o:Lua7;

    .line 185
    iput-object p3, p0, Lua7;->b:Ljava/lang/Object;

    .line 186
    iput-object p2, p0, Lua7;->c:Ljava/lang/Object;

    .line 187
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    .line 188
    new-instance p2, Lbl6;

    const/16 p3, 0x12

    invoke-direct {p2, p0, p3}, Lbl6;-><init>(Ljava/lang/Object;B)V

    .line 189
    iget-object p0, p1, Lrf7;->g:Lnrl;

    invoke-virtual {p0, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Lua7;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lua7;->a:B

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iget-object v0, p1, Lua7;->b:Ljava/lang/Object;

    check-cast v0, [J

    const/16 v1, 0xa

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    iput-object v0, p0, Lua7;->b:Ljava/lang/Object;

    .line 207
    iget-object v0, p1, Lua7;->c:Ljava/lang/Object;

    check-cast v0, [J

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 208
    iget-object p1, p1, Lua7;->d:Ljava/lang/Object;

    check-cast p1, [J

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p1

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lv31;)V
    .registers 5

    const/16 v0, 0x12

    iput-byte v0, p0, Lua7;->a:B

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 174
    sget-object v0, Lf7c;->c:Lf7c;

    new-instance v1, Lq4b;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    iput-object v0, p0, Lua7;->c:Ljava/lang/Object;

    .line 175
    new-instance v0, Loji;

    invoke-direct {v0, p1}, Loji;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;)V
    .registers 3

    const/16 v0, 0x19

    iput-byte v0, p0, Lua7;->a:B

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lua7;->b:Ljava/lang/Object;

    .line 102
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    .line 103
    new-instance p1, Lp4j;

    invoke-direct {p1}, Lp4j;-><init>()V

    .line 104
    const-string v0, "virus"

    invoke-virtual {p1, v0}, Lp4j;->add(Ljava/lang/Object;)Z

    .line 105
    const-string v0, "sexual"

    invoke-virtual {p1, v0}, Lp4j;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-static {p1}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object p1

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;[Ljava/lang/Object;)V
    .registers 9

    const/16 v0, 0xe

    iput-byte v0, p0, Lua7;->a:B

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    array-length v0, p1

    .line 228
    new-array v1, v0, [I

    .line 229
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x0

    :goto_10
    if-ge v3, v0, :cond_30

    .line 230
    aget-object v4, p1, v3

    .line 231
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    if-nez v5, :cond_27

    .line 232
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 233
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    :cond_27
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 235
    :cond_30
    iput-object v1, p0, Lua7;->b:Ljava/lang/Object;

    .line 236
    invoke-static {p1, v1}, Lua7;->m([Ljava/lang/Object;[I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    .line 237
    invoke-static {p2, v1}, Lua7;->m([Ljava/lang/Object;[I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public static B(Livb;)Z
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_f

    const/4 v1, 0x2

    if-eq p0, v1, :cond_f

    const/4 v1, 0x3

    if-eq p0, v1, :cond_f

    const/4 p0, 0x0

    return p0

    :cond_f
    return v0
.end method

.method public static final J(Lfrb;)Lua7;
    .registers 6

    const-string v0, "invalid keyset"

    const/4 v1, 0x0

    :try_start_3
    iget-object p0, p0, Lfrb;->a:Ljava/io/ByteArrayInputStream;
    :try_end_5
    .catch Lajb; {:try_start_3 .. :try_end_5} :catch_43

    :try_start_5
    new-instance v2, Ljava/lang/String;

    invoke-static {p0}, Lrym;->a(Ljava/io/ByteArrayInputStream;)[B

    move-result-object v3

    sget-object v4, Lfrb;->b:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v2}, Lwrb;->b(Ljava/lang/String;)Lpqb;

    move-result-object v2

    invoke-virtual {v2}, Lpqb;->h()Lprb;

    move-result-object v2

    invoke-static {v2}, Lfrb;->b(Lprb;)Lpwb;

    move-result-object v2
    :try_end_1c
    .catch Lsrb; {:try_start_5 .. :try_end_1c} :catch_37
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_1c} :catch_37
    .catchall {:try_start_5 .. :try_end_1c} :catchall_3e

    :try_start_1c
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    invoke-virtual {v2}, Lv5;->d()[B

    move-result-object p0
    :try_end_23
    .catch Lajb; {:try_start_1c .. :try_end_23} :catch_43

    :try_start_23
    invoke-static {}, Lxk8;->a()Lxk8;

    move-result-object v2

    invoke-static {p0, v2}, Lpwb;->B([BLxk8;)Lpwb;

    move-result-object p0

    invoke-static {p0}, Lua7;->k(Lpwb;)V

    invoke-static {p0}, Lua7;->r(Lpwb;)Lua7;

    move-result-object p0
    :try_end_32
    .catch Lajb; {:try_start_23 .. :try_end_32} :catch_33

    return-object p0

    :catch_33
    invoke-static {v0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :catch_37
    move-exception v2

    :try_start_38
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3e
    .catchall {:try_start_38 .. :try_end_3e} :catchall_3e

    :catchall_3e
    move-exception v2

    :try_start_3f
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v2
    :try_end_43
    .catch Lajb; {:try_start_3f .. :try_end_43} :catch_43

    :catch_43
    invoke-static {v0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public static V(Lowb;)Loup;
    .registers 6

    invoke-static {p0}, Lua7;->W(Lowb;)Lr6h;

    move-result-object p0

    sget-object v0, Luee;->b:Luee;

    iget-object v1, v0, Luee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr2j;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp2j;

    const-class v3, Lr6h;

    iget-object v4, p0, Lr6h;->b:Lm54;

    invoke-direct {v2, v3, v4}, Lp2j;-><init>(Ljava/lang/Class;Lm54;)V

    iget-object v1, v1, Lr2j;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    new-instance v0, Lcbc;

    invoke-direct {v0, p0}, Lcbc;-><init>(Lr6h;)V

    return-object v0

    :cond_28
    invoke-virtual {v0, p0}, Luee;->a(Ll2j;)Loup;

    move-result-object p0

    return-object p0
.end method

.method public static W(Lowb;)Lr6h;
    .registers 5

    invoke-virtual {p0}, Lowb;->w()I

    move-result v0

    invoke-virtual {p0}, Lowb;->x()Liuf;

    move-result-object v1

    sget-object v2, Liuf;->e:Liuf;

    if-ne v1, v2, :cond_e

    const/4 v0, 0x0

    goto :goto_12

    :cond_e
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_12
    invoke-virtual {p0}, Lowb;->v()Lnub;

    move-result-object v1

    invoke-virtual {v1}, Lnub;->x()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lowb;->v()Lnub;

    move-result-object v2

    invoke-virtual {v2}, Lnub;->y()Le54;

    move-result-object v2

    invoke-virtual {p0}, Lowb;->v()Lnub;

    move-result-object v3

    invoke-virtual {v3}, Lnub;->w()Lmub;

    move-result-object v3

    invoke-virtual {p0}, Lowb;->x()Liuf;

    move-result-object p0

    invoke-static {v1, v2, v3, p0, v0}, Lr6h;->a(Ljava/lang/String;Le54;Lmub;Liuf;Ljava/lang/Integer;)Lr6h;

    move-result-object p0

    return-object p0
.end method

.method public static k(Lpwb;)V
    .registers 5

    invoke-virtual {p0}, Lpwb;->y()Lefb;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowb;

    invoke-virtual {v0}, Lowb;->v()Lnub;

    move-result-object v1

    invoke-virtual {v1}, Lnub;->w()Lmub;

    move-result-object v1

    sget-object v2, Lmub;->b:Lmub;

    if-eq v1, v2, :cond_38

    invoke-virtual {v0}, Lowb;->v()Lnub;

    move-result-object v1

    invoke-virtual {v1}, Lnub;->w()Lmub;

    move-result-object v1

    sget-object v2, Lmub;->c:Lmub;

    if-eq v1, v2, :cond_38

    invoke-virtual {v0}, Lowb;->v()Lnub;

    move-result-object v1

    invoke-virtual {v1}, Lnub;->w()Lmub;

    move-result-object v1

    sget-object v2, Lmub;->d:Lmub;

    if-ne v1, v2, :cond_8

    :cond_38
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v0}, Lowb;->v()Lnub;

    move-result-object v1

    invoke-virtual {v1}, Lnub;->w()Lmub;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lowb;->v()Lnub;

    move-result-object v0

    invoke-virtual {v0}, Lnub;->x()Ljava/lang/String;

    move-result-object v0

    const-string v2, "keyset contains key material of type "

    const-string v3, " for type url "

    invoke-static {v2, v1, v3, v0}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5a
    return-void
.end method

.method public static m([Ljava/lang/Object;[I)[Ljava/lang/Object;
    .registers 9

    array-length v0, p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    sget-object v2, Landroidx/gridlayout/widget/GridLayout;->i:Landroid/util/LogPrinter;

    array-length v2, p1

    const/4 v3, -0x1

    const/4 v4, 0x0

    move v5, v4

    :goto_f
    if-ge v5, v2, :cond_1a

    aget v6, p1, v5

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    :cond_1a
    add-int/lit8 v3, v3, 0x1

    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    :goto_22
    if-ge v4, v0, :cond_2d

    aget v2, p1, v4

    aget-object v3, p0, v4

    aput-object v3, v1, v2

    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    :cond_2d
    return-object v1
.end method

.method public static o(Loup;Livb;I)Lowb;
    .registers 7

    sget-object v0, Luee;->b:Luee;

    iget-object v0, v0, Luee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr2j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lq2j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lr6h;

    invoke-direct {v1, v2, v3}, Lq2j;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    iget-object v0, v0, Lr2j;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2e

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgvb;

    iget-object v0, v0, Lgvb;->b:Lhvb;

    invoke-interface {v0, p0}, Lhvb;->j(Loup;)Lr6h;

    move-result-object v0

    goto :goto_36

    :cond_2e
    const-string v0, "No Key serializer for "

    const-string v2, " available"

    invoke-static {v1, v2, v0}, Lsjn;->h(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, v3

    :goto_36
    invoke-virtual {p0}, Loup;->b0()Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_48

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-eq p0, p2, :cond_48

    const-string p0, "Wrong ID set for key with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v3

    :cond_48
    invoke-static {}, Lowb;->A()Lnwb;

    move-result-object p0

    invoke-static {}, Lnub;->z()Llub;

    move-result-object v1

    iget-object v2, v0, Lr6h;->a:Ljava/lang/String;

    invoke-virtual {v1}, Lav9;->f()V

    iget-object v3, v1, Lav9;->b:Lfv9;

    check-cast v3, Lnub;

    invoke-virtual {v3, v2}, Lnub;->B(Ljava/lang/String;)V

    iget-object v2, v0, Lr6h;->c:Le54;

    invoke-virtual {v1}, Lav9;->f()V

    iget-object v3, v1, Lav9;->b:Lfv9;

    check-cast v3, Lnub;

    invoke-virtual {v3, v2}, Lnub;->C(Le54;)V

    iget-object v2, v0, Lr6h;->d:Lmub;

    invoke-virtual {v1}, Lav9;->f()V

    iget-object v3, v1, Lav9;->b:Lfv9;

    check-cast v3, Lnub;

    invoke-virtual {v3, v2}, Lnub;->A(Lmub;)V

    invoke-virtual {p0}, Lav9;->f()V

    iget-object v2, p0, Lav9;->b:Lfv9;

    check-cast v2, Lowb;

    invoke-virtual {v1}, Lav9;->b()Lfv9;

    move-result-object v1

    check-cast v1, Lnub;

    invoke-virtual {v2, v1}, Lowb;->B(Lnub;)V

    invoke-virtual {p0}, Lav9;->f()V

    iget-object v1, p0, Lav9;->b:Lfv9;

    check-cast v1, Lowb;

    invoke-virtual {v1, p1}, Lowb;->E(Livb;)V

    invoke-virtual {p0}, Lav9;->f()V

    iget-object p1, p0, Lav9;->b:Lfv9;

    check-cast p1, Lowb;

    invoke-virtual {p1, p2}, Lowb;->C(I)V

    iget-object p1, v0, Lr6h;->e:Liuf;

    invoke-virtual {p0}, Lav9;->f()V

    iget-object p2, p0, Lav9;->b:Lfv9;

    check-cast p2, Lowb;

    invoke-virtual {p2, p1}, Lowb;->D(Liuf;)V

    invoke-virtual {p0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, Lowb;

    return-object p0
.end method

.method public static final r(Lpwb;)Lua7;
    .registers 13

    invoke-virtual {p0}, Lpwb;->x()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_8c

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lpwb;->x()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Lpwb;->y()Lefb;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_80

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lowb;

    invoke-virtual {v4}, Lowb;->w()I

    move-result v8

    const/4 v5, 0x1

    const/4 v6, 0x0

    :try_start_2b
    invoke-static {v4}, Lua7;->V(Lowb;)Loup;

    move-result-object v0
    :try_end_2f
    .catch Ljava/security/GeneralSecurityException; {:try_start_2b .. :try_end_2f} :catch_31

    move v10, v6

    goto :goto_48

    :catch_31
    move-exception v0

    sget-object v7, Loz9;->a:Ld06;

    iget-object v7, v7, Ld06;->a:Ljava/lang/Object;

    check-cast v7, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_7f

    new-instance v0, Lcbc;

    invoke-static {v4}, Lua7;->W(Lowb;)Lr6h;

    move-result-object v7

    invoke-direct {v0, v7}, Lcbc;-><init>(Lr6h;)V

    move v10, v5

    :goto_48
    sget-object v7, Loz9;->a:Ld06;

    iget-object v7, v7, Ld06;->a:Ljava/lang/Object;

    check-cast v7, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-eqz v7, :cond_64

    invoke-virtual {v4}, Lowb;->y()Livb;

    move-result-object v7

    invoke-static {v7}, Lua7;->B(Livb;)Z

    move-result v7

    if-nez v7, :cond_64

    const-string p0, "Parsing of a single key failed (wrong status) and Tink is configured via validateKeysetsOnParsing to reject such keysets."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_64
    move v7, v5

    new-instance v5, Lqwb;

    invoke-virtual {v4}, Lowb;->y()Livb;

    move-result-object v4

    invoke-virtual {p0}, Lpwb;->z()I

    move-result v9

    if-ne v8, v9, :cond_73

    move v9, v7

    goto :goto_74

    :cond_73
    move v9, v6

    :goto_74
    sget-object v11, Lqwb;->h:Lpza;

    move-object v6, v0

    move-object v7, v4

    invoke-direct/range {v5 .. v11}, Lqwb;-><init>(Loup;Livb;IZZLpza;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    :cond_7f
    throw v0

    :cond_80
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    new-instance v0, Lua7;

    sget-object v1, Lb9e;->b:Lb9e;

    invoke-direct {v0, p0, v1}, Lua7;-><init>(Ljava/util/List;Lb9e;)V

    return-object v0

    :cond_8c
    const-string p0, "empty keyset"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public static t(Lua7;Lesg;)V
    .registers 5

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, [J

    iget-object v1, p1, Lesg;->b:Ljava/lang/Object;

    check-cast v1, Lua7;

    iget-object v2, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v2, [J

    iget-object p1, p1, Lesg;->c:Ljava/lang/Object;

    check-cast p1, [J

    invoke-static {v0, v2, p1}, Laib;->z([J[J[J)V

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, [J

    iget-object v2, v1, Lua7;->c:Ljava/lang/Object;

    check-cast v2, [J

    iget-object v1, v1, Lua7;->d:Ljava/lang/Object;

    check-cast v1, [J

    invoke-static {v0, v2, v1}, Laib;->z([J[J[J)V

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, [J

    invoke-static {p0, v1, p1}, Laib;->z([J[J[J)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/content/res/TypedArray;I)V
    .registers 4

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lzg;

    const/4 v0, 0x0

    iput v0, p0, Lzg;->a:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lzg;->c:Ljava/lang/Object;

    return-void
.end method

.method public final C(Lxd5;)V
    .registers 6

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Lap7;

    sget-object v2, Lap7;->a:Lap7;

    if-eq v1, v2, :cond_d

    return-void

    :cond_d
    sget-object v1, Lap7;->b:Lap7;

    iput-object v1, p0, Lua7;->c:Ljava/lang/Object;

    iget-object v1, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Lzo7;

    iget-object v1, v1, Lzo7;->a:Lode;

    sget-object v2, Lbp7;->a:Lbp7;

    invoke-virtual {v1, v2}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v1, Lrz;

    invoke-direct {v1}, Lrz;-><init>()V

    iput-object p1, v1, Lrz;->b:Ljava/lang/Object;

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    if-eqz p1, :cond_2e

    invoke-virtual {p1, v1}, Ltcc;->a(Lmdc;)V

    :cond_2e
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object p1

    new-instance v2, Lwci;

    invoke-direct {v2}, Lwci;-><init>()V

    const v3, 0x7f140a54

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v3, v2, Lwci;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ln9h;

    invoke-direct {v0, v2}, Ln9h;-><init>(Lwci;)V

    invoke-interface {p1, v0}, Lr0k;->i(Ln9h;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v2, Lyo7;

    const/4 v3, 0x0

    invoke-direct {v2, v1, p0, p1, v3}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Luk6;

    const/16 v1, 0x10

    invoke-direct {p1, v2, v1}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Luk6;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final D()V
    .registers 2

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lgjm;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    invoke-virtual {v0, p0}, Lgjm;->b(Ln37;)Z

    return-void
.end method

.method public final E(Lr37;Lf7f;)V
    .registers 4

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lgjm;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    invoke-interface {p0}, Ln37;->getId()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0}, Lgjm;->a(Ljava/lang/Class;)Loje;

    move-result-object p0

    invoke-virtual {v0, p1, p0, p2}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final F()V
    .registers 4

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lzg;

    const/4 v1, 0x0

    iput v1, v0, Lzg;->a:I

    :goto_7
    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, [Landroid/graphics/drawable/Drawable;

    array-length v2, v0

    if-ge v1, v2, :cond_14

    const/4 v2, 0x0

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_14
    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final G()V
    .registers 5

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    iget v2, v0, Lzg;->a:I

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/ColorStateList;

    const/4 v3, -0x1

    if-eqz v0, :cond_19

    invoke-virtual {v0, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    :cond_19
    if-eq v2, v3, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1e
    return-void
.end method

.method public final H(Lkotlin/jvm/functions/Function1;)V
    .registers 3

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Lt0i;

    if-eqz v0, :cond_12

    iget-object p0, v0, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    return-void

    :cond_12
    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    return-void
.end method

.method public final I(Lkotlin/jvm/functions/Function1;)V
    .registers 3

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Lt0i;

    if-eqz v0, :cond_12

    iget-object p0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, p0, Lq0i;

    if-nez v0, :cond_f

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    sget-object p0, Lt0i;->b:Lp0i;

    return-void

    :cond_12
    iput-object p1, p0, Lua7;->d:Ljava/lang/Object;

    return-void
.end method

.method public final K(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lxn8;

    if-eqz v0, :cond_e

    move-object v0, p1

    check-cast v0, Lxn8;

    invoke-interface {v0}, Lxn8;->c()Labk;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Labk;->a:Z

    :cond_e
    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lyn8;

    invoke-interface {v0, p1}, Lyn8;->f(Ljava/lang/Object;)V

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Lwng;

    invoke-virtual {p0, p1}, Lwng;->c(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final L(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Llv7;

    invoke-virtual {v0}, Llv7;->invoke()Ljava/lang/Object;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Li3j;

    iget-object p0, p0, Li3j;->c:Ljava/lang/Object;

    check-cast p0, Ltah;

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v0, Ltx0;

    const/16 v2, 0xf

    invoke-direct {v0, p1, v2}, Ltx0;-><init>(Ljava/lang/String;B)V

    new-instance p1, Lzx1;

    const/16 v2, 0xb

    invoke-direct {p1, v0, v2}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    move-result p1

    if-eqz p1, :cond_35

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_35
    return-void
.end method

.method public final M(Landroid/content/res/ColorStateList;)V
    .registers 5

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    iput-object p1, v0, Lzg;->c:Ljava/lang/Object;

    iget v0, v0, Lzg;->a:I

    const/4 v2, -0x1

    if-eqz p1, :cond_17

    invoke-virtual {p1, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    :cond_17
    if-eq v0, v2, :cond_1c

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1c
    return-void
.end method

.method public final N(Lyhe;)V
    .registers 2

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    if-eqz p1, :cond_b

    iget-object p1, p1, Lyhe;->b:Ljava/lang/Object;

    check-cast p1, Landroid/app/PendingIntent;

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    iput-object p1, p0, Ll1f;->g:Landroid/app/PendingIntent;

    return-void
.end method

.method public final O(Ljava/lang/CharSequence;)V
    .registers 2

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    invoke-virtual {p0, p1}, Ll1f;->e(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final P(Ljava/lang/CharSequence;)V
    .registers 2

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    invoke-virtual {p0, p1}, Ll1f;->f(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final Q([I)V
    .registers 3

    invoke-virtual {p1}, [I->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final R(Z)V
    .registers 3

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ll1f;->h(IZ)V

    return-void
.end method

.method public final S(I)V
    .registers 2

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    iget-object p0, p0, Ll1f;->G:Landroid/app/Notification;

    iput p1, p0, Landroid/app/Notification;->icon:I

    return-void
.end method

.method public final T(Landroid/graphics/drawable/Icon;)V
    .registers 5

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Ll1f;

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    sget-object v1, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/graphics/drawable/Icon;->getType()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_50

    const/4 p0, 0x4

    if-eq v1, p0, :cond_3a

    const/4 p0, 0x6

    if-eq v1, p0, :cond_23

    new-instance p0, Landroidx/core/graphics/drawable/IconCompat;

    const/4 v1, -0x1

    invoke-direct {p0, v1}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p1, p0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    goto :goto_60

    :cond_23
    invoke-virtual {p1}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroidx/core/graphics/drawable/IconCompat;

    invoke-direct {v1, p0}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p1, v1, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    :goto_38
    move-object p0, v1

    goto :goto_60

    :cond_3a
    invoke-virtual {p1}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroidx/core/graphics/drawable/IconCompat;

    invoke-direct {v1, p0}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p1, v1, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    goto :goto_38

    :cond_50
    invoke-virtual {p1}, Landroid/graphics/drawable/Icon;->getResPackage()Ljava/lang/String;

    move-result-object v1

    :try_start_54
    invoke-static {p0, v1}, Landroidx/core/graphics/drawable/IconCompat;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p1}, Landroid/graphics/drawable/Icon;->getResId()I

    move-result p1

    invoke-static {p0, v1, p1}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p0
    :try_end_60
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_54 .. :try_end_60} :catch_69

    :goto_60
    iget-object p1, v0, Ll1f;->a:Landroid/content/Context;

    invoke-static {p0, p1}, Lfr3;->f0(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object p0

    iput-object p0, v0, Ll1f;->H:Landroid/graphics/drawable/Icon;

    return-void

    :catch_69
    const-string p0, "Icon resource cannot be found"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final U()[B
    .registers 16

    const/16 v0, 0xa

    new-array v1, v0, [J

    new-array v2, v0, [J

    new-array v3, v0, [J

    iget-object v4, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v4, [J

    new-array v5, v0, [J

    new-array v6, v0, [J

    new-array v7, v0, [J

    new-array v8, v0, [J

    new-array v9, v0, [J

    new-array v10, v0, [J

    new-array v11, v0, [J

    new-array v12, v0, [J

    new-array v13, v0, [J

    new-array v14, v0, [J

    invoke-static {v5, v4}, Laib;->L([J[J)V

    invoke-static {v14, v5}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v6, v13, v4}, Laib;->z([J[J[J)V

    invoke-static {v7, v6, v5}, Laib;->z([J[J[J)V

    invoke-static {v13, v7}, Laib;->L([J[J)V

    invoke-static {v8, v13, v6}, Laib;->z([J[J[J)V

    invoke-static {v13, v8}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v9, v13, v8}, Laib;->z([J[J[J)V

    invoke-static {v13, v9}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    const/4 v4, 0x2

    move v5, v4

    :goto_4f
    if-ge v5, v0, :cond_5a

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    add-int/lit8 v5, v5, 0x2

    goto :goto_4f

    :cond_5a
    invoke-static {v10, v14, v9}, Laib;->z([J[J[J)V

    invoke-static {v13, v10}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    move v5, v4

    :goto_64
    const/16 v6, 0x14

    if-ge v5, v6, :cond_71

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    add-int/lit8 v5, v5, 0x2

    goto :goto_64

    :cond_71
    invoke-static {v13, v14, v10}, Laib;->z([J[J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    move v5, v4

    :goto_7b
    if-ge v5, v0, :cond_86

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    add-int/lit8 v5, v5, 0x2

    goto :goto_7b

    :cond_86
    invoke-static {v11, v13, v9}, Laib;->z([J[J[J)V

    invoke-static {v13, v11}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    move v0, v4

    :goto_90
    const/16 v5, 0x32

    if-ge v0, v5, :cond_9d

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    add-int/lit8 v0, v0, 0x2

    goto :goto_90

    :cond_9d
    invoke-static {v12, v14, v11}, Laib;->z([J[J[J)V

    invoke-static {v14, v12}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    move v0, v4

    :goto_a7
    const/16 v6, 0x64

    if-ge v0, v6, :cond_b4

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    add-int/lit8 v0, v0, 0x2

    goto :goto_a7

    :cond_b4
    invoke-static {v14, v13, v12}, Laib;->z([J[J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    :goto_bd
    if-ge v4, v5, :cond_c8

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    add-int/lit8 v4, v4, 0x2

    goto :goto_bd

    :cond_c8
    invoke-static {v13, v14, v11}, Laib;->z([J[J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v13, v14}, Laib;->L([J[J)V

    invoke-static {v14, v13}, Laib;->L([J[J)V

    invoke-static {v1, v14, v7}, Laib;->z([J[J[J)V

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, [J

    invoke-static {v2, v0, v1}, Laib;->z([J[J[J)V

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, [J

    invoke-static {v3, p0, v1}, Laib;->z([J[J[J)V

    invoke-static {v3}, Laib;->q([J)[B

    move-result-object p0

    const/16 v0, 0x1f

    aget-byte v1, p0, v0

    invoke-static {v2}, Laib;->q([J)[B

    move-result-object v2

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    and-int/lit8 v2, v2, 0x1

    shl-int/lit8 v2, v2, 0x7

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    return-object p0
.end method

.method public final X([IILandroid/graphics/drawable/Drawable;)V
    .registers 8

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, [Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lzg;

    aget-object v1, v0, p2

    iget-object v2, p0, Lzg;->c:Ljava/lang/Object;

    check-cast v2, Landroid/content/res/ColorStateList;

    if-eqz v2, :cond_3f

    const/4 v3, -0x1

    if-eqz v2, :cond_17

    invoke-virtual {v2, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    :cond_17
    iget p1, p0, Lzg;->a:I

    if-eq v3, p1, :cond_29

    iput v3, p0, Lzg;->a:I

    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    iget-object v1, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v3, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lzg;->d:Ljava/lang/Object;

    const/4 v1, 0x0

    :cond_29
    if-ne p3, v1, :cond_2d

    move-object p3, v1

    goto :goto_3f

    :cond_2d
    instance-of p1, p3, Landroidx/vectordrawable/graphics/drawable/AnimatedVectorDrawableCompat;

    if-nez p1, :cond_38

    instance-of p1, p3, Landroid/graphics/drawable/AnimatedVectorDrawable;

    if-nez p1, :cond_38

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_38
    iget-object p0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p3, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    :cond_3f
    :goto_3f
    aput-object p3, v0, p2

    return-void
.end method

.method public final a(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 3

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public final b()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 3

    new-instance v0, Lyzb;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lyzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lk1g;->z(Lm94;)Lo94;

    move-result-object p0

    return-object p0
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()I
    .registers 11

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Lwub;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ljl6;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_11
    const/4 v4, -0x1

    if-ge v3, v2, :cond_4b

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrxa;

    const/4 v6, 0x0

    :try_start_1b
    new-instance v7, Lcph;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {v7, v8, p0}, Lcph;-><init>(Ljava/io/InputStream;Ljl6;)V
    :try_end_2d
    .catchall {:try_start_1b .. :try_end_2d} :catchall_41

    :try_start_2d
    invoke-interface {v5, v7, p0}, Lrxa;->a(Ljava/io/InputStream;Ljl6;)I

    move-result v5
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_3e

    :try_start_31
    invoke-virtual {v7}, Lcph;->close()V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_34} :catch_34

    :catch_34
    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    if-eq v5, v4, :cond_3b

    move v4, v5

    goto :goto_4b

    :cond_3b
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :catchall_3e
    move-exception p0

    move-object v6, v7

    goto :goto_42

    :catchall_41
    move-exception p0

    :goto_42
    if-eqz v6, :cond_47

    :try_start_44
    invoke-virtual {v6}, Lcph;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_47} :catch_47

    :catch_47
    :cond_47
    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    throw p0

    :cond_4b
    :goto_4b
    return v4
.end method

.method public final e()Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .registers 10

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Lwub;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ljl6;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_11
    if-ge v3, v2, :cond_4a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrxa;

    const/4 v5, 0x0

    :try_start_1a
    new-instance v6, Lcph;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    move-result-object v8

    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {v6, v7, p0}, Lcph;-><init>(Ljava/io/InputStream;Ljl6;)V
    :try_end_2c
    .catchall {:try_start_1a .. :try_end_2c} :catchall_40

    :try_start_2c
    invoke-interface {v4, v6}, Lrxa;->c(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object v4
    :try_end_30
    .catchall {:try_start_2c .. :try_end_30} :catchall_3d

    :try_start_30
    invoke-virtual {v6}, Lcph;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_33

    :catch_33
    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    sget-object v5, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-ne v4, v5, :cond_4c

    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :catchall_3d
    move-exception p0

    move-object v5, v6

    goto :goto_41

    :catchall_40
    move-exception p0

    :goto_41
    if-eqz v5, :cond_46

    :try_start_43
    invoke-virtual {v5}, Lcph;->close()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_46

    :catch_46
    :cond_46
    invoke-virtual {v1}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    throw p0

    :cond_4a
    sget-object v4, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :cond_4c
    return-object v4
.end method

.method public final f(Lv6f;)V
    .registers 5

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_25

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    new-instance v1, Lfkc;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lfkc;-><init>(Lua7;B)V

    check-cast p1, Lg7a;

    invoke-virtual {p1, v1}, Lg7a;->execute(Ljava/lang/Runnable;)V

    :cond_25
    monitor-exit v0

    return-void

    :goto_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_5 .. :try_end_28} :catchall_29

    throw p0

    :catchall_29
    move-exception p0

    goto :goto_27
.end method

.method public final g(Ljava/util/concurrent/Executor;Lv6f;)V
    .registers 6

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    iget-object v2, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_26

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    new-instance p2, Lfkc;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lfkc;-><init>(Lua7;B)V

    check-cast p1, Lg7a;

    invoke-virtual {p1, p2}, Lg7a;->execute(Ljava/lang/Runnable;)V

    goto :goto_30

    :cond_26
    new-instance v1, Lzr9;

    const/16 v2, 0x12

    invoke-direct {v1, p0, p2, v2}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_30
    monitor-exit v0

    return-void

    :goto_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_5 .. :try_end_33} :catchall_34

    throw p0

    :catchall_34
    move-exception p0

    goto :goto_32
.end method

.method public final h()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Lwng;

    invoke-virtual {v0}, Lwng;->a()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_22

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lwn8;

    invoke-interface {p0}, Lwn8;->f()Ljava/lang/Object;

    move-result-object v0

    const-string p0, "FactoryPools"

    const/4 v1, 0x2

    invoke-static {p0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_22

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_22
    instance-of p0, v0, Lxn8;

    if-eqz p0, :cond_30

    move-object p0, v0

    check-cast p0, Lxn8;

    invoke-interface {p0}, Lxn8;->c()Labk;

    move-result-object p0

    const/4 v1, 0x0

    iput-boolean v1, p0, Labk;->a:Z

    :cond_30
    return-object v0
.end method

.method public final i(ILjava/lang/String;Lyhe;)V
    .registers 6

    iget-object p3, p3, Lyhe;->b:Ljava/lang/Object;

    check-cast p3, Landroid/app/PendingIntent;

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Ll1f;

    if-eqz p1, :cond_21

    new-instance v1, Lc1f;

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p1, p0}, Landroidx/core/graphics/drawable/IconCompat;->c(ILandroid/content/Context;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p0

    invoke-direct {v1, p0, p2, p3}, Lc1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {v1}, Lc1f;->a()Ld1f;

    move-result-object p0

    iget-object p1, v0, Ll1f;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_21
    invoke-virtual {v0, p1, p2, p3}, Ll1f;->a(ILjava/lang/String;Landroid/app/PendingIntent;)V

    return-void
.end method

.method public final j(Lu3j;)Z
    .registers 12

    new-instance v0, Lkd4;

    new-instance v1, Lqb4;

    invoke-direct {v1}, Lqb4;-><init>()V

    new-instance v2, Ltb5;

    invoke-direct {v2}, Ltb5;-><init>()V

    new-instance v3, Lm20;

    iget-object v4, p0, Lua7;->b:Ljava/lang/Object;

    move-object v7, v4

    check-cast v7, Lge4;

    move-object v4, v7

    check-cast v4, Lma4;

    iget-object v4, v4, Lma4;->a:Ljava/lang/String;

    const/4 v5, 0x4

    invoke-direct {v3, v4, v5}, Lm20;-><init>(Ljava/lang/String;B)V

    iget-object v4, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v4, Lgf4;

    new-instance v5, Lrdo;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lza9;

    invoke-virtual {v4}, Lgf4;->a()Lygh;

    move-result-object v8

    invoke-direct {v6, v8}, Lza9;-><init>(Lygh;)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v9}, Lkd4;-><init>(Lqb4;Ltb5;Lm20;Lgf4;Lpdo;Lfel;Lge4;Lyg4;Li16;)V

    const/4 v3, 0x1

    sget-object v6, Ln08;->a:Ln08;

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v7, v6

    move-object v2, p1

    invoke-virtual/range {v0 .. v7}, Lkd4;->a(ILu3j;ZLo3a;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;)Ljd4;

    move-result-object p1

    new-instance v0, Lfg6;

    const/16 v1, 0xf

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2, v1}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    sget-object p0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p0, v0}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final l()Li16;
    .registers 5

    new-instance v0, Li16;

    const-string v1, "Notifications.Android.Build"

    const/4 v2, 0x0

    :try_start_5
    iget-object v3, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v3, Ll1f;

    invoke-virtual {v3}, Ll1f;->b()Landroid/app/Notification;

    move-result-object v2
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_d} :catch_17
    .catchall {:try_start_5 .. :try_end_d} :catchall_12

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lioh;->t(Ljava/lang/String;Z)V

    goto :goto_1b

    :catchall_12
    move-exception p0

    invoke-static {v1, v2}, Lioh;->t(Ljava/lang/String;Z)V

    throw p0

    :catch_17
    invoke-static {v1, v2}, Lioh;->t(Ljava/lang/String;Z)V

    const/4 v2, 0x0

    :goto_1b
    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lcm;

    const/16 v1, 0x1b

    invoke-direct {v0, v2, p0, v1}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final n(Lcwd;)V
    .registers 6

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/LayoutInflater;

    iget-object v1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f0d01cc

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0322

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_52

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_52

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget v1, p1, Lcwd;->b:I

    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p1, Lcwd;->a:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    new-instance v1, Ljf7;

    const/16 v2, 0x16

    invoke-direct {v1, p0, p1, v2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lks8;

    const/4 p1, 0x2

    invoke-direct {p0, v1, p1}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_52
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 9

    iget-object p2, p0, Lua7;->b:Ljava/lang/Object;

    move-object v3, p2

    check-cast v3, Lg77;

    iget-object p2, p0, Lua7;->c:Ljava/lang/Object;

    move-object v4, p2

    check-cast v4, Lqq8;

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ly03;

    iget-object p0, v3, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lpq8;

    const/4 v1, 0x1

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lpq8;-><init>(ZLy03;Lg77;Lqq8;Lv84;)V

    invoke-interface {p0, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 11

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ly03;

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lqq8;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Lg77;

    iget-object p0, v4, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Lumi;

    iget-boolean v0, p2, Lpzh;->q:Z

    const/4 v7, 0x0

    if-eqz v0, :cond_5c

    iget v0, p2, Lpzh;->d:I

    const/16 v1, 0xcc

    if-ne v0, v1, :cond_2d

    new-instance p1, Lbn7;

    const/16 p2, 0x13

    invoke-direct {p1, v5, p2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v7}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_2d
    :try_start_2d
    iget-object p2, p2, Lpzh;->g:Lvzh;
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2f} :catch_4d

    :try_start_2f
    invoke-virtual {p2}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn7;

    const/16 v2, 0x14

    invoke-direct {v1, v5, v0, v2}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v7}, Lnml;->a(Ljava/lang/Object;)Loml;
    :try_end_41
    .catchall {:try_start_2f .. :try_end_41} :catchall_45

    :try_start_41
    invoke-interface {p2}, Ljava/io/Closeable;->close()V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_44} :catch_4d

    return-void

    :catchall_45
    move-exception v0

    move-object v1, v0

    :try_start_47
    throw v1
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_48

    :catchall_48
    move-exception v0

    :try_start_49
    invoke-static {p2, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4d} :catch_4d

    :catch_4d
    new-instance v1, Lpq8;

    const/4 v2, 0x1

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lpq8;-><init>(ZLy03;Lg77;Lqq8;Lv84;)V

    invoke-interface {p0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v7}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_5c
    move-object v6, p1

    invoke-virtual {p2}, Lpzh;->close()V

    new-instance v1, Lpq8;

    const/4 v2, 0x0

    invoke-direct/range {v1 .. v6}, Lpq8;-><init>(ZLy03;Lg77;Lqq8;Lv84;)V

    invoke-interface {p0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v7}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final p()Ln37;
    .registers 2

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Ln37;

    if-nez v0, :cond_14

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lp37;->E(Landroid/os/Bundle;)Ln37;

    move-result-object v0

    iput-object v0, p0, Lua7;->d:Ljava/lang/Object;

    :cond_14
    return-object v0
.end method

.method public final q(Z)V
    .registers 4

    sget-object v0, Lx1p;->o:Lua7;

    if-ne v0, p0, :cond_7

    const/4 v0, 0x0

    sput-object v0, Lx1p;->o:Lua7;

    :cond_7
    if-eqz p1, :cond_22

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "download.access_after_upgrade.all_access"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_22
    return-void
.end method

.method public final s(Lkyh;Ltrf;)Lkyh;
    .registers 5

    invoke-interface {p1}, Lkyh;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_21

    iget-object p1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p1, Lrbe;

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lzg3;

    invoke-static {p0, v0}, Lah3;->c(Lzg3;Landroid/graphics/Bitmap;)Lah3;

    move-result-object p0

    invoke-virtual {p1, p0, p2}, Lrbe;->s(Lkyh;Ltrf;)Lkyh;

    move-result-object p0

    return-object p0

    :cond_21
    instance-of v0, v0, Lkx9;

    if-eqz v0, :cond_2e

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Ls16;

    invoke-virtual {p0, p1, p2}, Ls16;->s(Lkyh;Ltrf;)Lkyh;

    move-result-object p0

    return-object p0

    :cond_2e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    iget-byte v0, p0, Lua7;->a:B

    sparse-switch v0, :sswitch_data_f6

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lx77;

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Lx77;

    const-string v1, ""

    :goto_27
    if-eqz p0, :cond_64

    iget-object v2, p0, Lx77;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3c
    if-eqz v2, :cond_5a

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_5a

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    goto :goto_5d

    :cond_5a
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_5d
    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Lx77;

    const-string v1, ", "

    goto :goto_27

    :cond_64
    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_6e
    invoke-virtual {p0}, Lua7;->v()Lpwb;

    move-result-object p0

    sget v0, Lrym;->a:I

    invoke-static {}, Luwb;->w()Lrwb;

    move-result-object v0

    invoke-virtual {p0}, Lpwb;->z()I

    move-result v1

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Luwb;

    invoke-virtual {v2, v1}, Luwb;->x(I)V

    invoke-virtual {p0}, Lpwb;->y()Lefb;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_8e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_eb

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lowb;

    invoke-static {}, Ltwb;->v()Lswb;

    move-result-object v2

    invoke-virtual {v1}, Lowb;->v()Lnub;

    move-result-object v3

    invoke-virtual {v3}, Lnub;->x()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lav9;->f()V

    iget-object v4, v2, Lav9;->b:Lfv9;

    check-cast v4, Ltwb;

    invoke-virtual {v4, v3}, Ltwb;->z(Ljava/lang/String;)V

    invoke-virtual {v1}, Lowb;->y()Livb;

    move-result-object v3

    invoke-virtual {v2}, Lav9;->f()V

    iget-object v4, v2, Lav9;->b:Lfv9;

    check-cast v4, Ltwb;

    invoke-virtual {v4, v3}, Ltwb;->y(Livb;)V

    invoke-virtual {v1}, Lowb;->x()Liuf;

    move-result-object v3

    invoke-virtual {v2}, Lav9;->f()V

    iget-object v4, v2, Lav9;->b:Lfv9;

    check-cast v4, Ltwb;

    invoke-virtual {v4, v3}, Ltwb;->x(Liuf;)V

    invoke-virtual {v1}, Lowb;->w()I

    move-result v1

    invoke-virtual {v2}, Lav9;->f()V

    iget-object v3, v2, Lav9;->b:Lfv9;

    check-cast v3, Ltwb;

    invoke-virtual {v3, v1}, Ltwb;->w(I)V

    invoke-virtual {v2}, Lav9;->b()Lfv9;

    move-result-object v1

    check-cast v1, Ltwb;

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Luwb;

    invoke-virtual {v2, v1}, Luwb;->v(Ltwb;)V

    goto :goto_8e

    :cond_eb
    invoke-virtual {v0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, Luwb;

    invoke-virtual {p0}, Lfv9;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_f6
    .sparse-switch
        0x13 -> :sswitch_6e
        0x1a -> :sswitch_a
    .end sparse-switch
.end method

.method public final u(I)Lqwb;
    .registers 6

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    if-ltz p1, :cond_3c

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_3c

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqwb;

    iget-object v2, v1, Lqwb;->b:Livb;

    invoke-static {v2}, Lua7;->B(Livb;)Z

    move-result v2

    const-string v3, "Keyset-Entry at position "

    if-eqz v2, :cond_32

    iget-boolean v1, v1, Lqwb;->f:Z

    if-nez v1, :cond_28

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqwb;

    return-object p0

    :cond_28
    const-string p0, " didn\'t parse correctly"

    invoke-static {p1, v3, p0}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v0

    :cond_32
    const-string p0, " has wrong status"

    invoke-static {p1, v3, p0}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v0

    :cond_3c
    const-string v1, "Invalid index "

    const-string v2, " for keyset of size "

    invoke-static {p1, v1, v2}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-static {p0, p1}, Lh9o;->g(ILjava/lang/StringBuilder;)V

    return-object v0
.end method

.method public final v()Lpwb;
    .registers 6

    :try_start_0
    invoke-static {}, Lpwb;->A()Lmwb;

    move-result-object v0

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_c
    :goto_c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqwb;

    invoke-virtual {v1}, Lqwb;->a()Loup;

    move-result-object v2

    iget v3, v1, Lqwb;->d:I

    iget-object v4, v1, Lqwb;->b:Livb;

    invoke-static {v2, v4, v3}, Lua7;->o(Loup;Livb;I)Lowb;

    move-result-object v2

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v4, v0, Lav9;->b:Lfv9;

    check-cast v4, Lpwb;

    invoke-virtual {v4, v2}, Lpwb;->v(Lowb;)V

    iget-boolean v1, v1, Lqwb;->e:Z

    if-eqz v1, :cond_c

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v1, v0, Lav9;->b:Lfv9;

    check-cast v1, Lpwb;

    invoke-virtual {v1, v3}, Lpwb;->C(I)V

    goto :goto_c

    :cond_3d
    invoke-virtual {v0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, Lpwb;
    :try_end_43
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_43} :catch_44

    return-object p0

    :catch_44
    move-exception p0

    invoke-static {p0}, Lpza;->m(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final w()Lqwb;
    .registers 4

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqwb;

    if-eqz v0, :cond_8

    iget-boolean v2, v0, Lqwb;->e:Z

    if-eqz v2, :cond_8

    iget-object p0, v0, Lqwb;->c:Lb30;

    sget-object v2, Lb30;->h:Lb30;

    if-ne p0, v2, :cond_22

    return-object v0

    :cond_22
    const-string p0, "Keyset has primary which isn\'t enabled"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_28
    const-string p0, "Keyset has no valid primary"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public final x()Ljava/lang/Object;
    .registers 15

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-object v1, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Lua7;

    if-nez v1, :cond_c

    move-object v2, p0

    goto :goto_d

    :cond_c
    move-object v2, v1

    :goto_d
    invoke-virtual {v2}, Lua7;->v()Lpwb;

    move-result-object v2

    sget v3, Lrym;->a:I

    invoke-virtual {v2}, Lpwb;->z()I

    move-result v3

    invoke-virtual {v2}, Lpwb;->y()Lefb;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    move v9, v5

    move v7, v6

    move v8, v7

    :cond_24
    :goto_24
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v11, 0x0

    if-eqz v10, :cond_b7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lowb;

    invoke-virtual {v10}, Lowb;->y()Livb;

    move-result-object v12

    sget-object v13, Livb;->c:Livb;

    if-ne v12, v13, :cond_24

    invoke-virtual {v10}, Lowb;->z()Z

    move-result v12

    if-eqz v12, :cond_9f

    invoke-virtual {v10}, Lowb;->x()Liuf;

    move-result-object v12

    sget-object v13, Liuf;->b:Liuf;

    if-eq v12, v13, :cond_87

    invoke-virtual {v10}, Lowb;->y()Livb;

    move-result-object v12

    sget-object v13, Livb;->b:Livb;

    if-eq v12, v13, :cond_6f

    invoke-virtual {v10}, Lowb;->w()I

    move-result v12

    if-ne v12, v3, :cond_5f

    if-nez v8, :cond_59

    move v8, v5

    goto :goto_5f

    :cond_59
    const-string p0, "keyset contains multiple primary keys"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v11

    :cond_5f
    :goto_5f
    invoke-virtual {v10}, Lowb;->v()Lnub;

    move-result-object v10

    invoke-virtual {v10}, Lnub;->w()Lmub;

    move-result-object v10

    sget-object v11, Lmub;->e:Lmub;

    if-eq v10, v11, :cond_6c

    move v9, v6

    :cond_6c
    add-int/lit8 v7, v7, 0x1

    goto :goto_24

    :cond_6f
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v10}, Lowb;->w()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "key %d has unknown status"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_87
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v10}, Lowb;->w()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "key %d has unknown prefix"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9f
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v10}, Lowb;->w()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "key %d has no key data"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_b7
    if-eqz v7, :cond_40e

    if-nez v8, :cond_c3

    if-nez v9, :cond_c3

    const-string p0, "keyset doesn\'t contain a valid primary key"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v11

    :cond_c3
    move v3, v6

    :goto_c4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_10b

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqwb;

    iget-boolean v4, v4, Lqwb;->f:Z

    if-nez v4, :cond_e5

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqwb;

    iget-object v4, v4, Lqwb;->b:Livb;

    invoke-static {v4}, Lua7;->B(Livb;)Z

    move-result v4

    if-eqz v4, :cond_e5

    add-int/lit8 v3, v3, 0x1

    goto :goto_c4

    :cond_e5
    invoke-virtual {v2, v3}, Lpwb;->w(I)Lowb;

    move-result-object p0

    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "Key parsing of key with index "

    const-string v2, " and type_url "

    invoke-static {v3, v1, v2}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lowb;->v()Lnub;

    move-result-object p0

    invoke-virtual {p0}, Lnub;->x()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " failed, unable to get primitive"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10b
    if-nez v1, :cond_10e

    move-object v1, p0

    :cond_10e
    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lb9e;

    sget-object v0, Lmee;->b:Lmee;

    iget-object v0, v0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbyg;

    iget-object v2, v0, Lbyg;->b:Ljava/util/HashMap;

    const-class v3, Lk9h;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_408

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le20;

    new-instance v3, Lmgf;

    const/16 v4, 0x9

    invoke-direct {v3, v0, v2, v4}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-byte v0, v2, Le20;->a:B

    const-string v2, " with parameters "

    const-string v4, "Cannot get output prefix for key of class "

    const-string v5, "PrefixMap only supports 0 and 5 byte prefixes"

    const/4 v7, 0x5

    packed-switch v0, :pswitch_data_414

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_144
    iget-object v8, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_1ca

    invoke-virtual {v1, v6}, Lua7;->u(I)Lqwb;

    move-result-object v8

    iget-object v9, v8, Lqwb;->c:Lb30;

    sget-object v10, Lb30;->h:Lb30;

    if-ne v9, v10, :cond_1a3

    invoke-virtual {v3, v8}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lk9h;

    invoke-virtual {v8}, Lqwb;->a()Loup;

    move-result-object v10

    instance-of v12, v10, Lnjj;

    if-eqz v12, :cond_16d

    check-cast v10, Lnjj;

    invoke-virtual {v10}, Lnjj;->z0()Lm54;

    move-result-object v10

    goto :goto_177

    :cond_16d
    instance-of v12, v10, Lcbc;

    if-eqz v12, :cond_1a6

    check-cast v10, Lcbc;

    invoke-virtual {v10}, Lcbc;->z0()Lm54;

    move-result-object v10

    :goto_177
    new-instance v12, Ll9h;

    iget v8, v8, Lqwb;->d:I

    invoke-direct {v12, v9, v8}, Ll9h;-><init>(Lk9h;I)V

    iget-object v8, v10, Lm54;->a:[B

    array-length v9, v8

    if-eqz v9, :cond_18b

    array-length v8, v8

    if-eq v8, v7, :cond_18b

    invoke-static {v5}, Lt3p;->w(Ljava/lang/String;)V

    goto/16 :goto_407

    :cond_18b
    invoke-virtual {v0, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_198

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    goto :goto_1a0

    :cond_198
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1a0
    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a3
    add-int/lit8 v6, v6, 0x1

    goto :goto_144

    :cond_1a6
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10}, Loup;->c0()Lc0g;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1ca
    iget-object p0, p0, Lb9e;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1db

    sget-object p0, Lyde;->b:Lyde;

    invoke-virtual {p0}, Lyde;->a()Lxde;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_1db
    new-instance v11, Lm9h;

    new-instance p0, Lbtg;

    invoke-direct {p0, v0}, Lbtg;-><init>(Ljava/util/HashMap;)V

    invoke-direct {v11, p0}, Lm9h;-><init>(Lbtg;)V

    goto/16 :goto_407

    :pswitch_1e7
    iget-object p0, p0, Lb9e;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1f8

    sget-object p0, Lyde;->b:Lyde;

    invoke-virtual {p0}, Lyde;->a()Lxde;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_1f8
    new-instance v11, Lkr7;

    invoke-virtual {v1}, Lua7;->w()Lqwb;

    move-result-object p0

    invoke-virtual {v3, p0}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li9h;

    invoke-virtual {v1}, Lua7;->w()Lqwb;

    move-result-object p0

    iget p0, p0, Lqwb;->d:I

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_407

    :pswitch_20f
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_214
    iget-object v8, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_299

    invoke-virtual {v1, v6}, Lua7;->u(I)Lqwb;

    move-result-object v8

    iget-object v9, v8, Lqwb;->c:Lb30;

    sget-object v10, Lb30;->h:Lb30;

    if-ne v9, v10, :cond_272

    invoke-virtual {v3, v8}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lhxg;

    invoke-virtual {v8}, Lqwb;->a()Loup;

    move-result-object v8

    instance-of v9, v8, Lh5d;

    if-eqz v9, :cond_23d

    check-cast v8, Lh5d;

    invoke-virtual {v8}, Lh5d;->z0()Lm54;

    move-result-object v8

    goto :goto_247

    :cond_23d
    instance-of v9, v8, Lcbc;

    if-eqz v9, :cond_275

    check-cast v8, Lcbc;

    invoke-virtual {v8}, Lcbc;->z0()Lm54;

    move-result-object v8

    :goto_247
    new-instance v9, La36;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iget-object v10, v8, Lm54;->a:[B

    array-length v12, v10

    if-eqz v12, :cond_259

    array-length v10, v10

    if-eq v10, v7, :cond_259

    invoke-static {v5}, Lt3p;->w(Ljava/lang/String;)V

    goto/16 :goto_407

    :cond_259
    invoke-virtual {v0, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_266

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    goto :goto_26f

    :cond_266
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v8, v10

    :goto_26f
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_272
    add-int/lit8 v6, v6, 0x1

    goto :goto_214

    :cond_275
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8}, Loup;->c0()Lc0g;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_299
    iget-object p0, p0, Lb9e;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2aa

    sget-object p0, Lyde;->b:Lyde;

    invoke-virtual {p0}, Lyde;->a()Lxde;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_2aa
    invoke-virtual {v1}, Lua7;->w()Lqwb;

    move-result-object p0

    invoke-virtual {v3, p0}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhxg;

    new-instance v11, Lhxg;

    invoke-virtual {v1}, Lua7;->w()Lqwb;

    new-instance p0, Lbtg;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_407

    :pswitch_2c0
    invoke-virtual {v1}, Lua7;->w()Lqwb;

    move-result-object p0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_2c9
    iget-object v8, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_349

    invoke-virtual {v1, v6}, Lua7;->u(I)Lqwb;

    move-result-object v8

    iget-object v9, v8, Lqwb;->c:Lb30;

    sget-object v10, Lb30;->h:Lb30;

    if-ne v9, v10, :cond_322

    invoke-virtual {v3, v8}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lc05;

    invoke-virtual {v8}, Lqwb;->a()Loup;

    move-result-object v8

    instance-of v10, v8, Lh5d;

    if-eqz v10, :cond_2f2

    check-cast v8, Lh5d;

    invoke-virtual {v8}, Lh5d;->z0()Lm54;

    move-result-object v8

    goto :goto_2fc

    :cond_2f2
    instance-of v10, v8, Lcbc;

    if-eqz v10, :cond_325

    check-cast v8, Lcbc;

    invoke-virtual {v8}, Lcbc;->z0()Lm54;

    move-result-object v8

    :goto_2fc
    iget-object v10, v8, Lm54;->a:[B

    array-length v12, v10

    if-eqz v12, :cond_309

    array-length v10, v10

    if-eq v10, v7, :cond_309

    invoke-static {v5}, Lt3p;->w(Ljava/lang/String;)V

    goto/16 :goto_407

    :cond_309
    invoke-virtual {v0, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_316

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    goto :goto_31f

    :cond_316
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v8, v10

    :goto_31f
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_322
    add-int/lit8 v6, v6, 0x1

    goto :goto_2c9

    :cond_325
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8}, Loup;->c0()Lc0g;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_349
    invoke-virtual {v3, p0}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc05;

    new-instance v11, Lc05;

    new-instance p0, Lbtg;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_407

    :pswitch_358
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_35d
    iget-object v8, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_3e2

    invoke-virtual {v1, v6}, Lua7;->u(I)Lqwb;

    move-result-object v8

    iget-object v9, v8, Lqwb;->c:Lb30;

    sget-object v10, Lb30;->h:Lb30;

    if-ne v9, v10, :cond_3bb

    invoke-virtual {v8}, Lqwb;->a()Loup;

    move-result-object v9

    instance-of v10, v9, Lb20;

    if-eqz v10, :cond_380

    check-cast v9, Lb20;

    invoke-virtual {v9}, Lb20;->z0()Lm54;

    move-result-object v9

    goto :goto_38a

    :cond_380
    instance-of v10, v9, Lcbc;

    if-eqz v10, :cond_3be

    check-cast v9, Lcbc;

    invoke-virtual {v9}, Lcbc;->z0()Lm54;

    move-result-object v9

    :goto_38a
    new-instance v10, Lujp;

    invoke-virtual {v3, v8}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lz10;

    const/16 v8, 0xf

    invoke-direct {v10, v8}, Lujp;-><init>(B)V

    iget-object v8, v9, Lm54;->a:[B

    array-length v12, v8

    if-eqz v12, :cond_3a3

    array-length v8, v8

    if-eq v8, v7, :cond_3a3

    invoke-static {v5}, Lt3p;->w(Ljava/lang/String;)V

    goto :goto_407

    :cond_3a3
    invoke-virtual {v0, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3b0

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    goto :goto_3b8

    :cond_3b0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3b8
    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3bb
    add-int/lit8 v6, v6, 0x1

    goto :goto_35d

    :cond_3be
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9}, Loup;->c0()Lc0g;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3e2
    iget-object p0, p0, Lb9e;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3f3

    sget-object p0, Lyde;->b:Lyde;

    invoke-virtual {p0}, Lyde;->a()Lxde;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_3f3
    new-instance v11, Ld20;

    invoke-virtual {v1}, Lua7;->w()Lqwb;

    move-result-object p0

    invoke-virtual {v3, p0}, Lmgf;->h(Lqwb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz10;

    invoke-virtual {v1}, Lua7;->w()Lqwb;

    new-instance p0, Lbtg;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    :goto_407
    return-object v11

    :cond_408
    const-string p0, "No wrapper found for "

    invoke-static {v3, p0}, Lpza;->n(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v11

    :cond_40e
    const-string p0, "keyset must contain at least one ENABLED key"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v11

    :pswitch_data_414
    .packed-switch 0x0
        :pswitch_358
        :pswitch_2c0
        :pswitch_20f
        :pswitch_1e7
    .end packed-switch
.end method

.method public y(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    return-object p0
.end method

.method public final z(FFLjava/lang/Object;Ljava/lang/Object;FFF)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Lg3d;

    iput p1, v0, Lg3d;->a:F

    iput p2, v0, Lg3d;->b:F

    iput-object p3, v0, Lg3d;->c:Ljava/lang/Object;

    iput-object p4, v0, Lg3d;->d:Ljava/lang/Object;

    iput p5, v0, Lg3d;->e:F

    iput p6, v0, Lg3d;->f:F

    iput p7, v0, Lg3d;->g:F

    invoke-virtual {p0, v0}, Lua7;->y(Lg3d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
