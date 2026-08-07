.class public final synthetic Ll/ojd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wld;


# direct methods
.method public synthetic constructor <init>(Ll/wld;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojd;->a:Ll/wld;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojd;->a:Ll/wld;

    invoke-static {p0}, Ll/wld;->z1(Ll/wld;)V

    return-void
.end method
