.class public final synthetic Ll/s3y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tar0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/swu0;


# direct methods
.method public synthetic constructor <init>(Ll/tar0;Ljava/lang/String;Ljava/lang/String;Ll/swu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s3y0;->a:Ll/tar0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s3y0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/s3y0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/s3y0;->d:Ll/swu0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s3y0;->a:Ll/tar0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s3y0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/s3y0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/s3y0;->d:Ll/swu0;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/tar0;->B8(Ljava/lang/String;Ljava/lang/String;Ll/swu0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
