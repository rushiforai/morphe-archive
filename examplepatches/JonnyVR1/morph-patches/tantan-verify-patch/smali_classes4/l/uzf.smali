.class public final synthetic Ll/uzf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/jl80;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uzf;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/uzf;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/uzf;->c:Ll/jl80;

    iput-object p4, p0, Ll/uzf;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uzf;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/uzf;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/uzf;->c:Ll/jl80;

    iget-object p0, p0, Ll/uzf;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/a0g;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
