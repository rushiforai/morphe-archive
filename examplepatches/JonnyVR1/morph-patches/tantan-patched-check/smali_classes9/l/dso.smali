.class public final synthetic Ll/dso;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hso$a;


# direct methods
.method public synthetic constructor <init>(Ll/hso$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dso;->a:Ll/hso$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dso;->a:Ll/hso$a;

    invoke-static {p0}, Ll/hso$a;->i(Ll/hso$a;)V

    return-void
.end method
