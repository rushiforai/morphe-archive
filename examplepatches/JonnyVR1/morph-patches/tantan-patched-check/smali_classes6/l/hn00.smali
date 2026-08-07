.class public final synthetic Ll/hn00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jn00;


# direct methods
.method public synthetic constructor <init>(Ll/jn00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hn00;->a:Ll/jn00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hn00;->a:Ll/jn00;

    invoke-static {p0}, Ll/jn00;->d(Ll/jn00;)V

    return-void
.end method
