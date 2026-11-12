.class public final enum Lkg7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum f:Lkg7;

.field public static final enum g:Lkg7;

.field public static final enum h:Lkg7;

.field public static final enum i:Lkg7;

.field public static final enum j:Lkg7;

.field public static final enum k:Lkg7;

.field public static final enum l:Lkg7;

.field public static final enum m:Lkg7;

.field public static final enum n:Lkg7;

.field public static final synthetic o:[Lkg7;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lkg7;

    const v6, 0x7f040290

    const v7, 0x7f040289

    const/4 v1, 0x0

    const-string v2, "GENERIC"

    const v3, 0x7f080553

    const v4, 0x7f04028f

    const v5, 0x7f04028e

    invoke-direct/range {v0 .. v7}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v0, Lkg7;->f:Lkg7;

    new-instance v1, Lkg7;

    const v7, 0x7f04027c

    const v8, 0x7f040285

    const/4 v2, 0x1

    const-string v3, "AUDIO"

    const v4, 0x7f0804fd

    const v5, 0x7f04027b

    const v6, 0x7f04027a

    invoke-direct/range {v1 .. v8}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v1, Lkg7;->g:Lkg7;

    new-instance v2, Lkg7;

    const v8, 0x7f040293

    const v9, 0x7f04028a

    const/4 v3, 0x2

    const-string v4, "VIDEO"

    const v5, 0x7f080621

    const v6, 0x7f040292

    const v7, 0x7f040291

    invoke-direct/range {v2 .. v9}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v2, Lkg7;->h:Lkg7;

    new-instance v3, Lkg7;

    const v9, 0x7f040282

    const v10, 0x7f040287

    const/4 v4, 0x3

    const-string v5, "IMAGE"

    const v6, 0x7f080575

    const v7, 0x7f040281

    const v8, 0x7f040280

    invoke-direct/range {v3 .. v10}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v3, Lkg7;->i:Lkg7;

    new-instance v4, Lkg7;

    const v10, 0x7f040276

    const v11, 0x7f040283

    const/4 v5, 0x4

    const-string v6, "APK"

    const v7, 0x7f0804ed

    const v8, 0x7f040275

    const v9, 0x7f040274

    invoke-direct/range {v4 .. v11}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v4, Lkg7;->j:Lkg7;

    new-instance v5, Lkg7;

    const v11, 0x7f04028d

    const v12, 0x7f040288

    const/4 v6, 0x5

    const-string v7, "PDF"

    const v8, 0x7f0805b2

    const v9, 0x7f04028c

    const v10, 0x7f04028b

    invoke-direct/range {v5 .. v12}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v5, Lkg7;->k:Lkg7;

    new-instance v6, Lkg7;

    const v12, 0x7f04027f

    const v13, 0x7f040286

    const/4 v7, 0x6

    const-string v8, "DOCUMENT"

    const v9, 0x7f080542

    const v10, 0x7f04027e

    const v11, 0x7f04027d

    invoke-direct/range {v6 .. v13}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v6, Lkg7;->l:Lkg7;

    new-instance v7, Lkg7;

    const v13, 0x7f04027f

    const v14, 0x7f040286

    const/4 v8, 0x7

    const-string v9, "HTML"

    const v10, 0x7f080542

    const v11, 0x7f04027e

    const v12, 0x7f04027d

    invoke-direct/range {v7 .. v14}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v7, Lkg7;->m:Lkg7;

    new-instance v8, Lkg7;

    const v14, 0x7f040279

    const v15, 0x7f040284

    const/16 v9, 0x8

    const-string v10, "ARCHIVE"

    const v11, 0x7f0804f1

    const v12, 0x7f040278

    const v13, 0x7f040277

    invoke-direct/range {v8 .. v15}, Lkg7;-><init>(ILjava/lang/String;IIIII)V

    sput-object v8, Lkg7;->n:Lkg7;

    filled-new-array/range {v0 .. v8}, [Lkg7;

    move-result-object v0

    sput-object v0, Lkg7;->o:[Lkg7;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IIIII)V
    .registers 8

    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lkg7;->a:I

    iput p4, p0, Lkg7;->d:I

    iput p5, p0, Lkg7;->b:I

    iput p6, p0, Lkg7;->e:I

    iput p7, p0, Lkg7;->c:I

    return-void
.end method

.method public static d(Landroid/content/Context;IF)Landroid/content/res/ColorStateList;
    .registers 5

    const v0, 0x7f04021b

    const v1, 0x7f06063b

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p2, p0}, Lp37;->j0(FI)I

    move-result p0

    filled-new-array {p0, p1}, [I

    move-result-object p0

    new-instance p1, Landroid/content/res/ColorStateList;

    sget-object p2, Llg7;->a:[[I

    invoke-direct {p1, p2, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1
.end method

.method public static valueOf(Ljava/lang/String;)Lkg7;
    .registers 2

    const-class v0, Lkg7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkg7;

    return-object p0
.end method

.method public static values()[Lkg7;
    .registers 1

    sget-object v0, Lkg7;->o:[Lkg7;

    invoke-virtual {v0}, [Lkg7;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkg7;

    return-object v0
.end method


# virtual methods
.method public final g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 7

    const/4 v0, 0x1

    const v1, 0x7f080241

    const v2, 0x7f06063b

    const v3, 0x3df5c28f    # 0.12f

    if-eq p1, v0, :cond_26

    const/4 v0, 0x2

    if-ne p1, v0, :cond_21

    iget p0, p0, Lkg7;->b:I

    invoke-static {p0, p2, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p2, p0, v3}, Lkg7;->d(Landroid/content/Context;IF)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-static {v1, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1, p0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object p1

    :cond_21
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_26
    iget p0, p0, Lkg7;->d:I

    invoke-static {p0, p2, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p2, p0, v3}, Lkg7;->d(Landroid/content/Context;IF)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-static {v1, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1, p0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object p1
.end method

.method public final h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 7

    iget v0, p0, Lkg7;->a:I

    invoke-static {v0, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f06063b

    const v3, 0x3ef5c28f    # 0.48f

    if-eq p1, v1, :cond_25

    const/4 v1, 0x2

    if-ne p1, v1, :cond_20

    iget p0, p0, Lkg7;->c:I

    invoke-static {p0, p2, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p2, p0, v3}, Lkg7;->d(Landroid/content/Context;IF)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-static {v0, p0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object v0

    :cond_20
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_25
    iget p0, p0, Lkg7;->b:I

    invoke-static {p0, p2, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p2, p0, v3}, Lkg7;->d(Landroid/content/Context;IF)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-static {v0, p0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object v0
.end method

.method public final i(Landroid/content/Context;)I
    .registers 3

    iget p0, p0, Lkg7;->b:I

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method
