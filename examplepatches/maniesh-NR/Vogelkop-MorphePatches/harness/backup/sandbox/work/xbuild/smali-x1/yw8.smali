.class public final synthetic Lyw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt37;


# instance fields
.field public final synthetic a:Lbx8;


# direct methods
.method public synthetic constructor <init>(Lbx8;)V
    .registers 2

    iput-object p1, p0, Lyw8;->a:Lbx8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 6

    instance-of v0, p1, Lab2;

    if-nez v0, :cond_5

    return-void

    :cond_5
    check-cast p1, Lab2;

    iget-object p0, p0, Lyw8;->a:Lbx8;

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_10
    :goto_10
    if-ge v1, v0, :cond_2c

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzw8;

    iget-object v2, v2, Lzw8;->b:Lxw8;

    if-eqz v2, :cond_10

    const-class v3, Lxw8;

    invoke-virtual {v3, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_10

    iget-object v2, v2, Lxw8;->h:Low8;

    invoke-virtual {v2, p1}, Lha2;->U(Lab2;)V

    goto :goto_10

    :cond_2c
    return-void
.end method
