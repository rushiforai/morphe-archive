.class public final synthetic Ll/hrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jl80;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/jl80;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hrk;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/hrk;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/hrk;->c:Ll/jl80;

    iput-boolean p4, p0, Ll/hrk;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hrk;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/hrk;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/hrk;->c:Ll/jl80;

    iget-boolean p0, p0, Ll/hrk;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Ll/qtk;->w0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/jl80;ZLandroid/view/View;)V

    return-void
.end method
