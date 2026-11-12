.class public final synthetic Ly9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:La21;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Lpdb;

.field public final synthetic d:Lvr0;


# direct methods
.method public synthetic constructor <init>(La21;Ljava/util/Set;Lpdb;Lvr0;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly9l;->a:La21;

    iput-object p2, p0, Ly9l;->b:Ljava/util/Set;

    iput-object p3, p0, Ly9l;->c:Lpdb;

    iput-object p4, p0, Ly9l;->d:Lvr0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    iget-object p1, p0, Ly9l;->d:Lvr0;

    const/4 p2, 0x0

    iget-object v0, p0, Ly9l;->a:La21;

    iget-object v1, p0, Ly9l;->b:Ljava/util/Set;

    iget-object p0, p0, Ly9l;->c:Lpdb;

    invoke-virtual {v0, v1, p0, p1, p2}, La21;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return-void
.end method
