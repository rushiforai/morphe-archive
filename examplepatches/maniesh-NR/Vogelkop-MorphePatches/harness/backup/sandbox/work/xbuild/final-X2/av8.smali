.class public final synthetic Lav8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt37;


# instance fields
.field public final synthetic a:Lcv8;


# direct methods
.method public synthetic constructor <init>(Lcv8;)V
    .registers 2

    iput-object p1, p0, Lav8;->a:Lcv8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 3

    instance-of v0, p1, Lab2;

    if-eqz v0, :cond_d

    iget-object p0, p0, Lav8;->a:Lcv8;

    iget-object p0, p0, Lcv8;->p:Lt5k;

    check-cast p1, Lab2;

    invoke-virtual {p0, p1}, Lha2;->U(Lab2;)V

    :cond_d
    return-void
.end method
