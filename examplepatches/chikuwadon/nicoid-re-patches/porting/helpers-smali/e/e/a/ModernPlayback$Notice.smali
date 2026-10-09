.class public final Le/e/a/ModernPlayback$Notice;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final context:Landroid/content/Context;

.field public final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPlayback$Notice;->context:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/ModernPlayback$Notice;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Le/e/a/ModernPlayback$Notice;->context:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/ModernPlayback$Notice;->message:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
