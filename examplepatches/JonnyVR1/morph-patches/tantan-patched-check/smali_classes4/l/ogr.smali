.class public final synthetic Ll/ogr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rgr$a;


# direct methods
.method public synthetic constructor <init>(Ll/rgr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ogr;->a:Ll/rgr$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogr;->a:Ll/rgr$a;

    invoke-static {p0}, Ll/rgr$a;->c(Ll/rgr$a;)V

    return-void
.end method
