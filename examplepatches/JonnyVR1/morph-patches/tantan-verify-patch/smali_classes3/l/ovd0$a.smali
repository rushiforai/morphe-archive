.class public Ll/ovd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ovd0;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/AuthData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/ovd0;


# direct methods
.method public constructor <init>(Ll/ovd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ovd0$a;->a:Ll/ovd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ovd0$a;->a:Ll/ovd0;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ovd0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ovd0$a;->a(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
