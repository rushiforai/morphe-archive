.class public final synthetic Ll/lw40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mw40;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/mw40;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lw40;->a:Ll/mw40;

    iput-object p2, p0, Ll/lw40;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lw40;->a:Ll/mw40;

    iget-object p0, p0, Ll/lw40;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/mw40;->q1(Ll/mw40;Ljava/io/File;)V

    return-void
.end method
