.class public final Le87;
.super Lb8e;
.source "SourceFile"

# interfaces
.implements Lhi5;


# instance fields
.field public final o:Lhkf;


# direct methods
.method public constructor <init>(Lhkf;)V
    .registers 2

    invoke-direct {p0}, Lb8e;-><init>()V

    iput-object p1, p0, Le87;->o:Lhkf;

    return-void
.end method


# virtual methods
.method public final L0()V
    .registers 2

    sget-object v0, Lcab;->a:Lhp7;

    invoke-static {p0, v0}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    sget-object v0, Lj41;->f:Lhp7;

    invoke-static {p0, v0}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object p0, p0, Le87;->o:Lhkf;

    invoke-static {v0, p0}, Loup;->f0(Landroid/view/View;Lhkf;)V

    return-void
.end method
