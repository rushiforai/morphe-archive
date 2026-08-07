.class public final synthetic Ll/mdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rdo;


# direct methods
.method public synthetic constructor <init>(Ll/rdo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mdo;->a:Ll/rdo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mdo;->a:Ll/rdo;

    invoke-static {p0}, Ll/rdo;->i(Ll/rdo;)V

    return-void
.end method
