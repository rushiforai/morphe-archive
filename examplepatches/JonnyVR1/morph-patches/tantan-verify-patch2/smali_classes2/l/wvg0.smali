.class public final synthetic Ll/wvg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/wtg0;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/lang/String;Ll/wtg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wvg0;->a:Ljava/io/File;

    iput-object p2, p0, Ll/wvg0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wvg0;->c:Ll/wtg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvg0;->a:Ljava/io/File;

    iget-object v1, p0, Ll/wvg0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wvg0;->c:Ll/wtg0;

    invoke-static {v0, v1, p0}, Ll/gwg0;->a(Ljava/io/File;Ljava/lang/String;Ll/wtg0;)V

    return-void
.end method
