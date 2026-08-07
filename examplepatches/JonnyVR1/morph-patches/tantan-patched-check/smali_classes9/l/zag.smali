.class public final synthetic Ll/zag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ebg;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ebg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zag;->a:Ll/ebg;

    iput-object p2, p0, Ll/zag;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zag;->a:Ll/ebg;

    iget-object p0, p0, Ll/zag;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/ebg;->O3(Ll/ebg;Ljava/lang/String;)V

    return-void
.end method
