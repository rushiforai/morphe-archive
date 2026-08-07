.class Ll/g410$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->s0(Ll/bql;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/bql;

.field final synthetic b:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Ll/bql;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$n;->b:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$n;->a:Ll/bql;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410$n;->a:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/bql;->M()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
