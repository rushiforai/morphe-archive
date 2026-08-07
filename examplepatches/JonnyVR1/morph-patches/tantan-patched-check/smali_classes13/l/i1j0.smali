.class public final synthetic Ll/i1j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1j0;->a:Landroid/app/Activity;

    iput-object p2, p0, Ll/i1j0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/i1j0;->c:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i1j0;->a:Landroid/app/Activity;

    iget-object v1, p0, Ll/i1j0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/i1j0;->c:Ljava/lang/Integer;

    invoke-static {v0, v1, p0}, Ll/o1j0;->f(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method
