.class public Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;
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
    name = "AnimalsBean"
.end annotation


# instance fields
.field private aid:Ljava/lang/String;

.field private sid:Ljava/lang/String;


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
.method public getAid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;->aid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;->sid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAid(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;->aid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSid(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;->sid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
