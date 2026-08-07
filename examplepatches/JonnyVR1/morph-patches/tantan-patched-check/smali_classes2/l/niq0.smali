.class public final synthetic Ll/niq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/oiq0;

.field public final synthetic b:Ljava/util/UUID;

.field public final synthetic c:Ll/i1j;

.field public final synthetic d:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/oiq0;Ljava/util/UUID;Ll/i1j;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/niq0;->a:Ll/oiq0;

    iput-object p2, p0, Ll/niq0;->b:Ljava/util/UUID;

    iput-object p3, p0, Ll/niq0;->c:Ll/i1j;

    iput-object p4, p0, Ll/niq0;->d:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/niq0;->a:Ll/oiq0;

    iget-object v1, p0, Ll/niq0;->b:Ljava/util/UUID;

    iget-object v2, p0, Ll/niq0;->c:Ll/i1j;

    iget-object p0, p0, Ll/niq0;->d:Landroid/content/Context;

    invoke-static {v0, v1, v2, p0}, Ll/oiq0;->b(Ll/oiq0;Ljava/util/UUID;Ll/i1j;Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
