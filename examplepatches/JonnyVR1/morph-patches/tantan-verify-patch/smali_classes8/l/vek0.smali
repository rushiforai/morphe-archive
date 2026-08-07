.class public final synthetic Ll/vek0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wek0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wek0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vek0;->a:Ll/wek0;

    iput-object p2, p0, Ll/vek0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vek0;->a:Ll/wek0;

    iget-object p0, p0, Ll/vek0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/wek0;->a(Ll/wek0;Ljava/lang/String;)V

    return-void
.end method
