.class public final synthetic Ll/tp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/up2;


# direct methods
.method public synthetic constructor <init>(Ll/up2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tp2;->a:Ll/up2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tp2;->a:Ll/up2;

    invoke-static {p0}, Ll/up2;->a(Ll/up2;)V

    return-void
.end method
