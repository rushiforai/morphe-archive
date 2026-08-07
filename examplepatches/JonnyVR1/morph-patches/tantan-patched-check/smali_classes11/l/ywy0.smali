.class public final synthetic Ll/ywy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qyy0;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ll/wx5;

.field public final synthetic d:Lcom/google/android/ump/ConsentInformation$b;

.field public final synthetic e:Lcom/google/android/ump/ConsentInformation$a;


# direct methods
.method public synthetic constructor <init>(Ll/qyy0;Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ywy0;->a:Ll/qyy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ywy0;->b:Landroid/app/Activity;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ywy0;->c:Ll/wx5;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ywy0;->d:Lcom/google/android/ump/ConsentInformation$b;

    .line 11
    .line 12
    iput-object p5, p0, Ll/ywy0;->e:Lcom/google/android/ump/ConsentInformation$a;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ywy0;->a:Ll/qyy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ywy0;->b:Landroid/app/Activity;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ywy0;->c:Ll/wx5;

    .line 6
    .line 7
    iget-object v3, p0, Ll/ywy0;->d:Lcom/google/android/ump/ConsentInformation$b;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ywy0;->e:Lcom/google/android/ump/ConsentInformation$a;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/qyy0;->b(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
