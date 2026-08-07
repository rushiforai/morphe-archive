.class public final synthetic Ll/szf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/szf;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/szf;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/szf;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/szf;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/szf;->e:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/szf;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/szf;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/szf;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/szf;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/szf;->e:Ll/jl80;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/a0g;->r(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
