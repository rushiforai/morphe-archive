.class public final Li25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lr9i;


# direct methods
.method public constructor <init>(Lr9i;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li25;->a:Lr9i;

    return-void
.end method


# virtual methods
.method public final onDestroy()V
    .registers 3

    iget-object p0, p0, Li25;->a:Lr9i;

    iget-object v0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v1, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Li25;

    invoke-virtual {v0, v1}, Lk6l;->x(Lj6l;)V

    iget-object v0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lj25;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
