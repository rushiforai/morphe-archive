.class public final Ll/hlu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/ilu0;


# direct methods
.method public constructor <init>(Ll/ilu0;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/hlu0;->a:Landroid/view/View;

    .line 2
    .line 3
    iput-object p1, p0, Ll/hlu0;->b:Ll/ilu0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/sgs0;->b5:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "omid native display exp"

    .line 20
    .line 21
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1, p0}, Ll/ebt0;->v(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hlu0;->b:Ll/ilu0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hlu0;->a:Landroid/view/View;

    .line 4
    .line 5
    check-cast p1, Ll/hfw0;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Ll/ilu0;->X(Ll/ilu0;Landroid/view/View;Ll/hfw0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
