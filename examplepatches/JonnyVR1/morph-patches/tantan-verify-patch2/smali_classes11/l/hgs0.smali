.class public final synthetic Ll/hgs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fpw0;


# instance fields
.field public final synthetic a:Ll/qgs0;

.field public final synthetic b:Ll/dgs0;


# direct methods
.method public synthetic constructor <init>(Ll/qgs0;Ll/dgs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hgs0;->a:Ll/qgs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hgs0;->b:Ll/dgs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hgs0;->a:Ll/qgs0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hgs0;->b:Ll/dgs0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/qgs0;->b(Ll/dgs0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
