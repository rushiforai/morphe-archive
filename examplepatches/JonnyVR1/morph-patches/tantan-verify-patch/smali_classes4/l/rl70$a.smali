.class public Ll/rl70$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rl70;->m(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ll/rl70;


# direct methods
.method public constructor <init>(Ll/rl70;Ll/x20;Ll/jl80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rl70$a;->c:Ll/rl70;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rl70$a;->a:Ll/x20;

    .line 4
    .line 5
    iput-object p3, p0, Ll/rl70$a;->b:Ll/jl80;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/rl70$a;->a:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/rl70$a;->a:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/rl70$a;->b:Ll/jl80;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
