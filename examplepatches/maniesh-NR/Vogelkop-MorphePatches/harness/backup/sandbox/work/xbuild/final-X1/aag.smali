.class public final synthetic Laag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;
.implements Lekj;


# instance fields
.field public final synthetic a:Lbag;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lbag;Ljava/util/List;)V
    .registers 3

    iput-object p1, p0, Laag;->a:Lbag;

    iput-object p2, p0, Laag;->b:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Laag;->a:Lbag;

    invoke-interface {p0}, Lbag;->s()V

    return-void
.end method

.method public final b(Lhjm;)V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_9

    iget-object p0, p0, Laag;->a:Lbag;

    invoke-interface {p0}, Lbag;->s()V

    :cond_9
    return-void
.end method
