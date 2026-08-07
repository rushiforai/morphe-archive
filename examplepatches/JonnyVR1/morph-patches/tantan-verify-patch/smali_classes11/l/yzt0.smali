.class public final Ll/yzt0;
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
    iput-object p2, p0, Ll/yzt0;->a:Ll/lvw0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/yzt0;->b:Ll/zzt0;

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
    iget-object v0, p0, Ll/yzt0;->b:Ll/zzt0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zzt0;->c(Ll/zzt0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/yzt0;->a:Ll/lvw0;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/lvw0;->zza(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yzt0;->b:Ll/zzt0;

    .line 2
    .line 3
    check-cast p1, Ll/kzt0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zzt0;->c(Ll/zzt0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/yzt0;->a:Ll/lvw0;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/lvw0;->zzb(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
