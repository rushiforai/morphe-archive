.class public Ll/azy$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wo50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/azy;->L0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/azy;


# direct methods
.method public constructor <init>(Ll/azy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/azy$j;->a:Ll/azy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/azy$j;->a:Ll/azy;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "takePhoto fail Exception= "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/azy;->t0(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$j;->a:Ll/azy;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/azy;->A(Ll/azy;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
