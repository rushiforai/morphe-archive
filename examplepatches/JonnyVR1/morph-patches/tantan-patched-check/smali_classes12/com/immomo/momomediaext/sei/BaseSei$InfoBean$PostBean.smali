.class public Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PostBean"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private n:Ljava/lang/String;

.field private screens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field private t:Ljava/lang/String;

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getA()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getN()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreens()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->screens:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getT()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getZ()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public setA(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setN(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setScreens(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->screens:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setT(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setZ(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;->z:I

    .line 2
    .line 3
    return-void
.end method
