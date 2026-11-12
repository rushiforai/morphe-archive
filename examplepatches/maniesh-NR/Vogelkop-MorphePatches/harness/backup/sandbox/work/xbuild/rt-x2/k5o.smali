.class public final Lk5o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwv9;
.implements Ljv0;
.implements Ln0g;
.implements Lih4;
.implements Lhbb;
.implements Lcom/leanplum/LeanplumPushNotificationCustomizer;
.implements Lph4;
.implements Ldrf;


# static fields
.field public static final d:Lhv5;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lk5o;->d:Lhv5;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lk5o;->a:B

    packed-switch p1, :pswitch_data_2a

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 160
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void

    .line 161
    :pswitch_17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    new-instance p1, Lsee;

    invoke-direct {p1}, Lsee;-><init>()V

    .line 163
    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 164
    new-instance p1, Lsee;

    invoke-direct {p1}, Lsee;-><init>()V

    .line 165
    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x18
        :pswitch_17
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 157
    iput-byte p1, p0, Lk5o;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lk5o;->a:B

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 168
    new-instance p1, Lal7;

    const/16 v0, 0xe

    invoke-direct {p1, p0, v0}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljg8;)V
    .registers 4

    const/16 v0, 0xf

    iput-byte v0, p0, Lk5o;->a:B

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk5o;->b:Ljava/lang/Object;

    .line 125
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Lv1f;Ltcc;Landroid/view/View$OnClickListener;)V
    .registers 9

    const/16 v0, 0x15

    iput-byte v0, p0, Lk5o;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1401b7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f1409d1

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const v1, 0x7f0a05cc

    invoke-static {p1, v0, v1}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    const/high16 v0, 0x41d00000    # 26.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    new-instance v1, Lh13;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f080755

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v1, v2, v0, v0}, Lh13;-><init>(Landroid/graphics/drawable/Drawable;II)V

    iput-object v1, p0, Lk5o;->c:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    if-eqz p2, :cond_75

    if-eqz p3, :cond_75

    iget-object p2, p2, Lv1f;->c:Lr1f;

    new-instance v0, Lj7d;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lj7d;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p2, Lp1f;->a:Li7f;

    invoke-virtual {p0, v0}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_60

    iget-object p0, p2, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_60
    new-instance p0, Ld62;

    invoke-direct {p0, p2, v0}, Ld62;-><init>(Lp1f;Lt1f;)V

    invoke-virtual {p3, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p2}, Lr1f;->a()Z

    move-result p0

    iget-boolean p2, v1, Lh13;->d:Z

    if-eq p0, p2, :cond_75

    iput-boolean p0, v1, Lh13;->d:Z

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_75
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public constructor <init>(Landroidx/work/impl/WorkDatabase_Impl;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lk5o;->a:B

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 149
    new-instance v0, Lb37;

    const/4 v1, 0x6

    .line 150
    invoke-direct {v0, p1, v1}, Lb37;-><init>(Ly5i;B)V

    .line 151
    iput-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    .line 152
    new-instance p0, Luzk;

    const/16 v0, 0x14

    .line 153
    invoke-direct {p0, p1, v0}, Luzk;-><init>(Ly5i;B)V

    return-void
.end method

.method public constructor <init>(Lbd6;)V
    .registers 4

    const/16 v0, 0xb

    iput-byte v0, p0, Lk5o;->a:B

    .line 179
    new-instance v0, Lrq6;

    .line 180
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 181
    new-instance v1, Lr16;

    .line 182
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 183
    iput-object v1, v0, Lrq6;->a:Lr16;

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    iput-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    .line 186
    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lk5o;->a:B

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    .line 206
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    .line 207
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    .line 208
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyk6;

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/OperaApplication;[Lw9c;)V
    .registers 4

    const/16 v0, 0x14

    iput-byte v0, p0, Lk5o;->a:B

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 171
    iput-object p2, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcsh;Lcsh;)V
    .registers 4

    const/16 v0, 0x1d

    iput-byte v0, p0, Lk5o;->a:B

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    new-instance v0, Lt9h;

    invoke-direct {v0, p1}, Lt9h;-><init>(Lcsh;)V

    iput-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    .line 178
    new-instance p1, Lt9h;

    invoke-direct {p1, p2}, Lt9h;-><init>(Lcsh;)V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Le3j;Ljv1;)V
    .registers 4

    const/16 v0, 0x10

    iput-byte v0, p0, Lk5o;->a:B

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p2, p0, Lk5o;->b:Ljava/lang/Object;

    .line 128
    new-instance p2, Llld;

    const/4 v0, 0x7

    invoke-direct {p2, p1, v0}, Llld;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lhv;)V
    .registers 3

    const/16 v0, 0x1a

    iput-byte v0, p0, Lk5o;->a:B

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 173
    new-instance p1, Lcf2;

    const/4 v0, 0x0

    .line 174
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 175
    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 123
    iput-byte p3, p0, Lk5o;->a:B

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    iput-object p2, p0, Lk5o;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function2;)V
    .registers 3

    const/16 v0, 0x9

    iput-byte v0, p0, Lk5o;->a:B

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 200
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkze;Lor2;Ltsd;)V
    .registers 6

    const/16 v0, 0x19

    iput-byte v0, p0, Lk5o;->a:B

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-object p2, p0, Lk5o;->b:Ljava/lang/Object;

    .line 131
    iput-object p3, p0, Lk5o;->c:Ljava/lang/Object;

    .line 132
    sget v0, Ld03;->e:I

    iget-object p2, p2, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 133
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f08024b

    invoke-static {v1, v0}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 134
    invoke-static {p2, v0}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 135
    new-instance v0, Ld8d;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 136
    new-instance p1, Llzb;

    const/16 p3, 0x18

    invoke-direct {p1, p0, p3}, Llzb;-><init>(Ljava/lang/Object;B)V

    .line 137
    invoke-static {p2, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    .line 138
    invoke-virtual {p1, p2}, Llzb;->a(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lmxb;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Lk5o;->a:B

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 156
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqg7;)V
    .registers 3

    const/16 v0, 0xd

    iput-byte v0, p0, Lk5o;->a:B

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    .line 202
    new-instance p1, Lbl6;

    const/16 v0, 0x1a

    invoke-direct {p1, p0, v0}, Lbl6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lua7;)V
    .registers 4

    const/16 v0, 0x17

    iput-byte v0, p0, Lk5o;->a:B

    .line 139
    new-instance v0, Ld5o;

    .line 140
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Ld5o;->a:Ljava/lang/Object;

    .line 142
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, v0, Ld5o;->b:Ljava/lang/Object;

    .line 143
    iput-object p1, v0, Ld5o;->c:Ljava/lang/Object;

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance p1, Ljc9;

    const/4 v1, 0x2

    invoke-direct {p1, v1}, Ljc9;-><init>(B)V

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    .line 146
    iput-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luv4;Lole;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Lk5o;->a:B

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk5o;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lw69;Landroid/util/SparseArray;)V
    .registers 8

    const/4 v0, 0x3

    iput-byte v0, p0, Lk5o;->a:B

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    iput-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    .line 189
    new-instance v0, Landroid/util/SparseArray;

    .line 190
    iget-object v1, p1, Lw69;->a:Landroid/util/SparseBooleanArray;

    .line 191
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    .line 192
    invoke-direct {v0, v2}, Landroid/util/SparseArray;-><init>(I)V

    const/4 v2, 0x0

    .line 193
    :goto_14
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_2d

    .line 194
    invoke-virtual {p1, v2}, Lw69;->b(I)I

    move-result v3

    .line 195
    invoke-virtual {p2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ld11;

    .line 196
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 198
    :cond_2d
    iput-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lyp7;Lf1p;)V
    .registers 4

    const/16 v0, 0x12

    iput-byte v0, p0, Lk5o;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk5o;->b:Ljava/lang/Object;

    new-instance v0, Lisd;

    .line 121
    iget-object p2, p2, Lf1p;->a:Ljava/lang/Object;

    check-cast p2, Ljava/math/BigInteger;

    .line 122
    invoke-virtual {p1, p2}, Lcq7;->j(Ljava/math/BigInteger;)Lxf8;

    move-result-object p1

    const/16 p2, 0x15

    invoke-direct {v0, p1, p2}, Lisd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    return-void
.end method

.method public static e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_e

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_e
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_1c

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1c
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method

.method public static q(Ljava/io/ObjectInputStream;)Ljava/util/HashMap;
    .registers 14

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_9

    return-object v1

    :cond_9
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x0

    move v5, v4

    :goto_14
    if-ge v5, v0, :cond_69

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_66

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v7

    if-ne v7, v2, :cond_60

    new-instance v7, Ljava/util/EnumMap;

    const-class v8, Llag;

    invoke-direct {v7, v8}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v8

    move v9, v4

    :goto_34
    if-ge v9, v8, :cond_55

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    :try_start_42
    invoke-static {v10}, Llag;->valueOf(Ljava/lang/String;)Llag;

    move-result-object v10

    new-instance v12, Liag;

    invoke-static {v11}, Lkag;->valueOf(Ljava/lang/String;)Lkag;

    move-result-object v11

    invoke-direct {v12, v11, v2}, Liag;-><init>(Lkag;Z)V

    invoke-virtual {v7, v10, v12}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_52
    .catch Ljava/lang/IllegalArgumentException; {:try_start_42 .. :try_end_52} :catch_52

    :catch_52
    add-int/lit8 v9, v9, 0x1

    goto :goto_34

    :cond_55
    new-instance v8, Ljag;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-object v7, v8, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v3, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_66

    :cond_60
    const-string p0, "Unknown version"

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    return-object v1

    :cond_66
    :goto_66
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    :cond_69
    return-object v3
.end method


# virtual methods
.method public final a(Ljava/lang/Integer;)Ljava/util/List;
    .registers 5

    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Ldrf;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ldrf;->a(Ljava/lang/Integer;)Ljava/util/List;

    move-result-object v0

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Llqj;

    iget v1, p0, Llqj;->v:I

    if-gez v1, :cond_12

    return-object v0

    :cond_12
    iget-object v2, p0, Llqj;->b:[I

    invoke-virtual {p0, v1, v2}, Llqj;->D(I[I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p0, p1, v1, v2}, Lz5i;->p(Llqj;Ljava/lang/Integer;ILjava/lang/Integer;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, p0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public final b(Litb;Ljava/util/ArrayList;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    move-object v1, p1

    check-cast v1, Ln15;

    invoke-interface {v1}, Ln15;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1d

    new-instance v2, Lm0g;

    invoke-direct {v2}, Lm0g;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1d

    move-object v2, v0

    :cond_1d
    check-cast v2, Lm0g;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p2, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_2f
    if-ge v3, v1, :cond_42

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lytb;

    new-instance v5, Lbub;

    invoke-direct {v5, v4}, Lbub;-><init>(Lytb;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_42
    iget-object v1, v2, Lm0g;->a:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_6e

    :try_start_4a
    sget-object v2, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function2;

    invoke-interface {p0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;
    :try_end_56
    .catchall {:try_start_4a .. :try_end_56} :catchall_57

    goto :goto_60

    :catchall_57
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_60
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_6d

    move-object v2, p1

    goto :goto_6e

    :cond_6d
    move-object v2, p0

    :cond_6e
    :goto_6e
    check-cast v2, Lt0i;

    iget-object p0, v2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final c()Z
    .registers 1

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Ldrf;

    invoke-interface {p0}, Ldrf;->c()Z

    move-result p0

    return p0
.end method

.method public final cancel()V
    .registers 3

    iget-byte v0, p0, Lk5o;->a:B

    packed-switch v0, :pswitch_data_28

    iget-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Lcf2;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_17

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lhv;

    invoke-virtual {p0}, Lhv;->invoke()Ljava/lang/Object;

    :cond_17
    return-void

    :pswitch_18
    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Lih4;

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    invoke-interface {v0}, Lih4;->cancel()V

    iput-object v1, p0, Lk5o;->b:Ljava/lang/Object;

    :cond_24
    iput-object v1, p0, Lk5o;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x11
        :pswitch_18
    .end packed-switch
.end method

.method public final customize(Landroid/app/Notification$Builder;Landroid/os/Bundle;Landroid/app/Notification$Style;)V
    .registers 4

    .line 36
    return-void
.end method

.method public final customize(Ll1f;Landroid/os/Bundle;)V
    .registers 8

    iget-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, [Lw9c;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_7
    if-ge v2, v1, :cond_15

    aget-object v4, v0, v2

    invoke-interface {v4, p2}, Lw9c;->h(Landroid/os/Bundle;)Z

    move-result v4

    if-eqz v4, :cond_12

    const/4 v3, 0x1

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_15
    if-eqz v3, :cond_23

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-class v0, Lcom/leanplum/LeanplumPushReceiver;

    invoke-static {p0, p2, v0}, Lcom/leanplum/LeanplumPushService;->createContentIntent(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Class;)Landroid/app/PendingIntent;

    move-result-object p0

    iput-object p0, p1, Ll1f;->g:Landroid/app/PendingIntent;

    :cond_23
    return-void
.end method

.method public final d(Loqe;)V
    .registers 6

    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    instance-of v1, p1, Lmsh;

    if-eqz v1, :cond_28

    move-object p0, p1

    check-cast p0, Lmsh;

    iget-object v1, p0, Lmsh;->v:Lp12;

    iget-object v2, v1, Lp12;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_41

    new-instance v3, Lh92;

    iget-object p1, p1, Loqe;->c:Ljava/lang/String;

    iget-object v1, v1, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Loqe;->d:Lqre;

    invoke-direct {v3, p1, v1, p0}, Lh92;-><init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_28
    instance-of v0, p1, Lere;

    if-eqz v0, :cond_41

    move-object v0, p1

    check-cast v0, Lere;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    iget-object v0, v0, Lere;->e:Ljava/lang/String;

    new-instance v1, Li92;

    iget-object v2, p1, Loqe;->c:Ljava/lang/String;

    iget-object p1, p1, Loqe;->d:Lqre;

    invoke-direct {v1, v2, p1}, Li92;-><init>(Ljava/lang/String;Lqre;)V

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_41
    return-void
.end method

.method public final f(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lvz9;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lvz9;

    iget v1, v0, Lvz9;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lvz9;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lvz9;

    invoke-direct {v0, p0, p1}, Lvz9;-><init>(Lk5o;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lvz9;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lvz9;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lwz9;

    invoke-direct {p1, p0, v3}, Lwz9;-><init>(Lk5o;Lmt5;)V

    iput v4, v0, Lvz9;->v:I

    invoke-static {p1, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    return-object p0
.end method

.method public final g(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Ltz9;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ltz9;

    iget v1, v0, Ltz9;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ltz9;->w:I

    goto :goto_1a

    :cond_13
    new-instance v0, Ltz9;

    check-cast p2, Lnt5;

    invoke-direct {v0, p0, p2}, Ltz9;-><init>(Lk5o;Lnt5;)V

    :goto_1a
    iget-object p2, v0, Ltz9;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ltz9;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3d

    if-eq v2, v4, :cond_33

    if-ne v2, v3, :cond_2d

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6d

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_33
    iget-object p1, v0, Ltz9;->t:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_4f

    :cond_3d
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Luz9;

    invoke-direct {p2, p0, v5}, Luz9;-><init>(Lk5o;Lmt5;)V

    iput-object p1, v0, Ltz9;->t:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    iput v4, v0, Ltz9;->w:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_6c

    :goto_4f
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p2

    if-nez p2, :cond_5a

    check-cast p0, Lcom/google/android/gms/location/LocationSettingsResponse;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_5a
    instance-of p0, p2, Lcom/google/android/gms/common/api/ResolvableApiException;

    if-eqz p0, :cond_74

    check-cast p2, Lcom/google/android/gms/common/api/ResolvableApiException;

    iput-object v5, v0, Ltz9;->t:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    iput v3, v0, Ltz9;->w:I

    sget-object p0, Lk5o;->d:Lhv5;

    invoke-virtual {p0, p2, p1, v0}, Lhv5;->K(Lcom/google/android/gms/common/api/ResolvableApiException;Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_6d

    :cond_6c
    return-object v1

    :cond_6d
    :goto_6d
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_75

    :cond_74
    const/4 p0, 0x0

    :goto_75
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final h(I)Z
    .registers 2

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lw69;

    iget-object p0, p0, Lw69;->a:Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p0

    return p0
.end method

.method public final i(Ljava/math/BigInteger;)[Ljava/math/BigInteger;
    .registers 6

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lf1p;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lkli;

    iget-short v0, p0, Lkli;->g:S

    iget-object v1, p0, Lkli;->e:Ljava/math/BigInteger;

    invoke-static {p1, v1, v0}, Lphj;->A(Ljava/math/BigInteger;Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v1

    iget-object v2, p0, Lkli;->f:Ljava/math/BigInteger;

    invoke-static {p1, v2, v0}, Lphj;->A(Ljava/math/BigInteger;Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v0

    iget-object v2, p0, Lkli;->a:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lkli;->c:Ljava/math/BigInteger;

    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p1

    iget-object v2, p0, Lkli;->b:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    iget-object p0, p0, Lkli;->d:Ljava/math/BigInteger;

    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public final j(Ljava/util/List;Lx92;)V
    .registers 4

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/BrowserActivity;->i1(Ljava/util/List;Lx92;)V

    return-void
.end method

.method public final k(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Llld;

    new-instance v1, Lhu5;

    const/16 v2, 0x9

    invoke-direct {v1, p1, p0, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Llld;->e0(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lx5f;->S(I)V

    new-instance v0, Lv92;

    invoke-direct {v0, p1}, Lv92;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Lx92;->g:Lx92;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/BrowserActivity;->i1(Ljava/util/List;Lx92;)V

    return-void
.end method

.method public final m(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 4

    sget-object v0, Le6i;->i:Ljava/util/TreeMap;

    const/4 v0, 0x1

    const-string v1, "SELECT DISTINCT tag FROM worktag WHERE work_spec_id=?"

    invoke-static {v0, v1}, Laoh;->e(ILjava/lang/String;)Le6i;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Le6i;->w(ILjava/lang/String;)V

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/work/impl/WorkDatabase_Impl;

    invoke-virtual {p0}, Ly5i;->b()V

    invoke-virtual {p0, v1}, Ly5i;->s(Lssk;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_17
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_20
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2e
    .catchall {:try_start_17 .. :try_end_2e} :catchall_36

    goto :goto_20

    :cond_2f
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v1}, Le6i;->release()V

    return-object p1

    :catchall_36
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v1}, Le6i;->release()V

    throw p1
.end method

.method public final n(Ldqd;Ljava/lang/String;)Z
    .registers 4

    iget v0, p1, Ldqd;->b:I

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    if-gez v0, :cond_15

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    iget-object p1, p1, Ldqd;->a:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_1d

    :cond_15
    iget p1, p1, Ldqd;->c:I

    invoke-virtual {p0, p2, v0, p1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0

    if-nez p0, :cond_1f

    :goto_1d
    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public final o()Z
    .registers 1

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->m:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final p(Liw4;)V
    .registers 7

    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Lole;

    iget-object v1, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v1, Luv4;

    iget-object v2, v1, Luv4;->c:Landroid/os/Handler;

    new-instance v3, Lvr9;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v0, p1, v4}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, v1, Luv4;->c:Landroid/os/Handler;

    new-instance v1, Lwr9;

    const/4 v2, 0x0

    invoke-direct {v1, v4, p0, p1, v2}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    const-wide/16 p0, 0x1

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final r(Ljava/lang/String;Z)V
    .registers 3

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    if-eqz p2, :cond_a

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lh92;

    if-eqz p2, :cond_1d

    iget-object p2, p2, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    if-nez p2, :cond_1d

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d
    return-void
.end method

.method public final s(I)Lhyl;
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, [I

    array-length v2, v1

    if-ge v0, v2, :cond_16

    aget v1, v1, v0

    if-ne p1, v1, :cond_13

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, [Luhi;

    aget-object p0, p0, v0

    return-object p0

    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_16
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Unmatched track of type: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lw7d;->q(Ljava/lang/String;)V

    new-instance p0, Ls97;

    invoke-direct {p0}, Ls97;-><init>()V

    return-object p0
.end method

.method public final t(Luae;)V
    .registers 16

    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Lsee;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lsee;

    invoke-virtual {p0, p1}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_96

    instance-of v1, p0, Ldee;

    if-eqz v1, :cond_93

    check-cast p0, Ldee;

    iget-object v1, p0, Ldee;->a:[Ljava/lang/Object;

    iget p0, p0, Ldee;->b:I

    const/4 v2, 0x0

    move v3, v2

    :goto_1a
    if-ge v3, p0, :cond_96

    aget-object v4, v1, v3

    if-nez v4, :cond_8f

    new-instance v4, Lzbe;

    const/4 v5, 0x2

    invoke-direct {v4, p1, v5}, Lzbe;-><init>(Ljava/lang/Object;B)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_8c

    instance-of v7, v6, Ldee;

    if-eqz v7, :cond_7d

    check-cast v6, Ldee;

    iget v7, v6, Ldee;->b:I

    iget-object v8, v6, Ldee;->a:[Ljava/lang/Object;

    invoke-static {v2, v7}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v9

    iget v10, v9, Lkotlin/ranges/a;->a:I

    iget v9, v9, Lkotlin/ranges/a;->b:I

    move v11, v2

    if-gt v10, v9, :cond_5d

    :goto_42
    sub-int v12, v10, v11

    aget-object v13, v8, v10

    aput-object v13, v8, v12

    aget-object v12, v8, v10

    invoke-interface {v4, v12}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-eqz v12, :cond_58

    add-int/lit8 v11, v11, 0x1

    :cond_58
    if-eq v10, v9, :cond_5d

    add-int/lit8 v10, v10, 0x1

    goto :goto_42

    :cond_5d
    sub-int v4, v7, v11

    invoke-static {v8, v4, v7, v5}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    iget v4, v6, Ldee;->b:I

    sub-int/2addr v4, v11

    iput v4, v6, Ldee;->b:I

    invoke-virtual {v6}, Ldee;->i()Z

    move-result v4

    if-eqz v4, :cond_70

    invoke-virtual {v0, v5}, Lsee;->k(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_70
    iget v4, v6, Ldee;->b:I

    const/4 v7, 0x1

    if-ne v4, v7, :cond_8c

    invoke-virtual {v6}, Ldee;->f()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v5, v4}, Lsee;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8c

    :cond_7d
    invoke-interface {v4, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_8c

    invoke-virtual {v0, v5}, Lsee;->k(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8c
    :goto_8c
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_8f
    invoke-static {}, Lh9o;->t()V

    return-void

    :cond_93
    invoke-static {}, Lh9o;->t()V

    :cond_96
    return-void
.end method

.method public final toInstant()Lebb;
    .registers 4

    new-instance v0, Lrh6;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " when parsing an Instant from \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    const/16 v2, 0x40

    invoke-static {v2, p0}, Li41;->q0(ILjava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x22

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->r:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final v()Z
    .registers 1

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->s:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method
