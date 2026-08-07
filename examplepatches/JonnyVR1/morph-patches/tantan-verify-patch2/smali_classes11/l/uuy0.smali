.class public final synthetic Ll/uuy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qyy0;

.field public final synthetic b:Lcom/google/android/ump/ConsentInformation$b;

.field public final synthetic c:Ll/n6z0;


# direct methods
.method public synthetic constructor <init>(Ll/qyy0;Lcom/google/android/ump/ConsentInformation$b;Ll/n6z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uuy0;->a:Ll/qyy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uuy0;->b:Lcom/google/android/ump/ConsentInformation$b;

    .line 7
    .line 8
    iput-object p3, p0, Ll/uuy0;->c:Ll/n6z0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uuy0;->a:Ll/qyy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uuy0;->b:Lcom/google/android/ump/ConsentInformation$b;

    .line 4
    .line 5
    iget-object p0, p0, Ll/uuy0;->c:Ll/n6z0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/qyy0;->a(Lcom/google/android/ump/ConsentInformation$b;Ll/n6z0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
