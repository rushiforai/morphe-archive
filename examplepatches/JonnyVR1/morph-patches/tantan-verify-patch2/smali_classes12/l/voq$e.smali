.class Ll/voq$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->r2(ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$e;->b:Ll/voq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/voq$e;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/voq$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ll/voq$e$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/voq$e$a;-><init>(Ll/voq$e;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/k33;->a(Ljava/lang/String;Ll/k33$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
