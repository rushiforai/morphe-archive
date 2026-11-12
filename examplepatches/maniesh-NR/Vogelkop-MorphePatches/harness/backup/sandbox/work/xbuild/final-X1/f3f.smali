.class public final Lf3f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt1f;


# instance fields
.field public final synthetic a:Lg3f;


# direct methods
.method public constructor <init>(Lg3f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf3f;->a:Lg3f;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    iget-object p0, p0, Lf3f;->a:Lg3f;

    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    return-void
.end method
