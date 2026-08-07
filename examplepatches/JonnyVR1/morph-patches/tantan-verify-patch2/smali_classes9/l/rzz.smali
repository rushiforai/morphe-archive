.class public final synthetic Ll/rzz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz$b;


# direct methods
.method public synthetic constructor <init>(Ll/qzz$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rzz;->a:Ll/qzz$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzz;->a:Ll/qzz$b;

    invoke-static {p0}, Ll/qzz$b;->a(Ll/qzz$b;)V

    return-void
.end method
