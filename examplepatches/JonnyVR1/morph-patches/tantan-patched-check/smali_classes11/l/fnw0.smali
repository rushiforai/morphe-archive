.class public final synthetic Ll/fnw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:Ll/snw0;

.field public final synthetic b:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Ll/snw0;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fnw0;->a:Ll/snw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fnw0;->b:Ll/sni0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fnw0;->a:Ll/snw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fnw0;->b:Ll/sni0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/snw0;->t(Ll/sni0;Lcom/google/android/gms/tasks/Task;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
