.class public Ll/wxh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/momo/mcamera/mask/MaskModel;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/momo/mcamera/mask/MaskModel;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/momo/mcamera/mask/MaskModel;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 15
    .line 16
    return-void
.end method

.method public static a()I
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    return v0
.end method


# virtual methods
.method public b()Lcom/momo/mcamera/mask/MaskModel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Lcom/momo/mcamera/mask/MaskModel;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setModelType(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 7
    .line 8
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskModel;->setDuration(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wxh0;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setModelType(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
