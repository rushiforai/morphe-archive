.class public final Ll/xzt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/lvw0;

.field public final synthetic b:Ll/zzt0;


# direct methods
.method public constructor <init>(Ll/zzt0;Ll/lvw0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/xzt0;->a:Ll/lvw0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/xzt0;->b:Ll/zzt0;

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
    iget-object v0, p0, Ll/xzt0;->a:Ll/lvw0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/lvw0;->zza(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xzt0;->b:Ll/zzt0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/zzt0;->c(Ll/zzt0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ll/szt0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/szt0;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object v0, p0, Ll/xzt0;->a:Ll/lvw0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/xzt0;->b:Ll/zzt0;

    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Ll/zzt0;->b(Ll/zzt0;Ljava/util/List;Ll/lvw0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
