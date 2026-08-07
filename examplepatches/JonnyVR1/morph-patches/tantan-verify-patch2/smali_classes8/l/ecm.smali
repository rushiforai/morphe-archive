.class public final synthetic Ll/ecm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hcm;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/hcm;Ll/jl80;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ecm;->a:Ll/hcm;

    iput-object p2, p0, Ll/ecm;->b:Ll/jl80;

    iput-wide p3, p0, Ll/ecm;->c:J

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ecm;->a:Ll/hcm;

    iget-object v1, p0, Ll/ecm;->b:Ll/jl80;

    iget-wide v2, p0, Ll/ecm;->c:J

    invoke-static {v0, v1, v2, v3, p1}, Ll/hcm;->j(Ll/hcm;Ll/jl80;JLandroid/view/View;)V

    return-void
.end method
