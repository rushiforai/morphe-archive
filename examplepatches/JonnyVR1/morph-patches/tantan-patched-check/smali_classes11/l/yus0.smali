.class public final synthetic Ll/yus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zus0;

.field public final synthetic b:Ll/ots0;


# direct methods
.method public synthetic constructor <init>(Ll/zus0;Ll/ots0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yus0;->a:Ll/zus0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yus0;->b:Ll/ots0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/yus0;->b:Ll/ots0;

    .line 2
    .line 3
    const-string v0, "/result"

    .line 4
    .line 5
    sget-object v1, Ll/aqs0;->o:Ll/qqs0;

    .line 6
    .line 7
    invoke-interface {p0, v0, v1}, Ll/cvs0;->k0(Ljava/lang/String;Ll/bqs0;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ll/ots0;->zzc()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
