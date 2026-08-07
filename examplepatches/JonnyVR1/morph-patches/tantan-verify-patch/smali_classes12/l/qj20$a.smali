.class Ll/qj20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qj20;->y(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ll/qj20;


# direct methods
.method public constructor <init>(Ll/qj20;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qj20$a;->b:Ll/qj20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qj20$a;->a:Landroid/content/Context;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qj20$a;->b:Ll/qj20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qj20$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/qj20;->a(Ll/qj20;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
