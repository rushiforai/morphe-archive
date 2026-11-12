.class public final synthetic Ldk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyj2;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ln61;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ln61;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldk2;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ldk2;->b:Ln61;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    sget-object v0, Lak2;->f:Lak2;

    invoke-static {v0, p1}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object v0

    iget-object v1, p0, Ldk2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lak2;->e:Lak2;

    invoke-static {v0, p1}, Lek2;->m(Lak2;Z)Lysn;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    new-array p1, p1, [Lysn;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lysn;

    iget-object p0, p0, Ldk2;->b:Ln61;

    invoke-virtual {p0, p1}, Ln61;->k([Lysn;)V

    return-void
.end method
