.class public final synthetic Ll/uod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vod;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/vod;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uod;->a:Ll/vod;

    iput-object p2, p0, Ll/uod;->b:Ljava/lang/String;

    iput p3, p0, Ll/uod;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uod;->a:Ll/vod;

    iget-object v1, p0, Ll/uod;->b:Ljava/lang/String;

    iget p0, p0, Ll/uod;->c:I

    invoke-static {v0, v1, p0}, Ll/vod;->a(Ll/vod;Ljava/lang/String;I)V

    return-void
.end method
