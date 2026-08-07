.class public abstract Lcom/p1/mobile/putong/core/ui/visitor/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/visitor/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/cfm0;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

.field public d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->c:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract E(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/cfm0;",
            ">;)V"
        }
    .end annotation
.end method
