.class public final synthetic Ll/gew0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hew0;

.field public final synthetic b:Ll/vdw0;


# direct methods
.method public synthetic constructor <init>(Ll/hew0;Ll/vdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gew0;->a:Ll/hew0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gew0;->b:Ll/vdw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gew0;->a:Ll/hew0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gew0;->b:Ll/vdw0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/hew0;->c(Ll/vdw0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
