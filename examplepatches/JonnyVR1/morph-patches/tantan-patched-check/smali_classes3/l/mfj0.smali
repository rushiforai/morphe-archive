.class public final synthetic Ll/mfj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfj0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/mfj0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mfj0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/mfj0;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->a(Ljava/lang/String;Ljava/util/List;Ljava/lang/Throwable;)V

    return-void
.end method
