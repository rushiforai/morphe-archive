.class public final synthetic Ll/iqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/uog0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLl/uog0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/iqg0;->a:Z

    iput-object p2, p0, Ll/iqg0;->b:Ll/uog0;

    iput-object p3, p0, Ll/iqg0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/iqg0;->a:Z

    iget-object v1, p0, Ll/iqg0;->b:Ll/uog0;

    iget-object p0, p0, Ll/iqg0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/osg0;->m(ZLl/uog0;Ljava/lang/String;)V

    return-void
.end method
