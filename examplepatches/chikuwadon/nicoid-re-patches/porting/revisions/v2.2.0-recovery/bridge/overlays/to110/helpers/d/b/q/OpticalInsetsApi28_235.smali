.class public Ld/b/q/OpticalInsetsApi28_235;
.super Ljava/lang/Object;
.source "DrawableUtils.java"


# static fields
.field private static final sBottom:Ljava/lang/reflect/Field;

.field private static final sGetOpticalInsets:Ljava/lang/reflect/Method;

.field private static final sLeft:Ljava/lang/reflect/Field;

.field private static final sReflectionSuccessful:Z

.field private static final sRight:Ljava/lang/reflect/Field;

.field private static final sTop:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 143
    const/4 v0, 0x0

    .line 144
    .local v0, "getOpticalInsets":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .line 145
    .local v1, "left":Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .line 146
    .local v2, "top":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .line 147
    .local v3, "right":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    .line 148
    .local v4, "bottom":Ljava/lang/reflect/Field;
    const/4 v5, 0x0

    .line 151
    .local v5, "success":Z
    const/4 v6, 0x0

    :try_start_0
    const-string v7, "android.graphics.Insets"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 152
    .local v7, "insets":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v8, Landroid/graphics/drawable/Drawable;

    const-string v9, "getOpticalInsets"

    new-array v10, v6, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    move-object v0, v8

    .line 153
    const-string v8, "left"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    move-object v1, v8

    .line 154
    const-string v8, "top"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    move-object v2, v8

    .line 155
    const-string v8, "right"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    move-object v3, v8

    .line 156
    const-string v8, "bottom"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v8

    .line 157
    const/4 v5, 0x1

    .end local v7    # "insets":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_0

    .line 162
    :catch_0
    move-exception v7

    goto :goto_1

    .line 160
    :catch_1
    move-exception v7

    goto :goto_0

    .line 158
    :catch_2
    move-exception v7

    .line 164
    :goto_0
    nop

    .line 166
    :goto_1
    if-eqz v5, :cond_0

    .line 167
    sput-object v0, Ld/b/q/OpticalInsetsApi28_235;->sGetOpticalInsets:Ljava/lang/reflect/Method;

    .line 168
    sput-object v1, Ld/b/q/OpticalInsetsApi28_235;->sLeft:Ljava/lang/reflect/Field;

    .line 169
    sput-object v2, Ld/b/q/OpticalInsetsApi28_235;->sTop:Ljava/lang/reflect/Field;

    .line 170
    sput-object v3, Ld/b/q/OpticalInsetsApi28_235;->sRight:Ljava/lang/reflect/Field;

    .line 171
    sput-object v4, Ld/b/q/OpticalInsetsApi28_235;->sBottom:Ljava/lang/reflect/Field;

    .line 172
    const/4 v6, 0x1

    sput-boolean v6, Ld/b/q/OpticalInsetsApi28_235;->sReflectionSuccessful:Z

    goto :goto_2

    .line 174
    :cond_0
    const/4 v7, 0x0

    sput-object v7, Ld/b/q/OpticalInsetsApi28_235;->sGetOpticalInsets:Ljava/lang/reflect/Method;

    .line 175
    sput-object v7, Ld/b/q/OpticalInsetsApi28_235;->sLeft:Ljava/lang/reflect/Field;

    .line 176
    sput-object v7, Ld/b/q/OpticalInsetsApi28_235;->sTop:Ljava/lang/reflect/Field;

    .line 177
    sput-object v7, Ld/b/q/OpticalInsetsApi28_235;->sRight:Ljava/lang/reflect/Field;

    .line 178
    sput-object v7, Ld/b/q/OpticalInsetsApi28_235;->sBottom:Ljava/lang/reflect/Field;

    .line 179
    sput-boolean v6, Ld/b/q/OpticalInsetsApi28_235;->sReflectionSuccessful:Z

    .line 181
    .end local v0    # "getOpticalInsets":Ljava/lang/reflect/Method;
    .end local v1    # "left":Ljava/lang/reflect/Field;
    .end local v2    # "top":Ljava/lang/reflect/Field;
    .end local v3    # "right":Ljava/lang/reflect/Field;
    .end local v4    # "bottom":Ljava/lang/reflect/Field;
    .end local v5    # "success":Z
    :goto_2
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    return-void
.end method

.method public static getOpticalInsets(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .registers 7
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 189
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_1

    sget-boolean v0, Ld/b/q/OpticalInsetsApi28_235;->sReflectionSuccessful:Z

    if-eqz v0, :cond_1

    .line 191
    :try_start_0
    sget-object v0, Ld/b/q/OpticalInsetsApi28_235;->sGetOpticalInsets:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 192
    .local v0, "insets":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 193
    new-instance v1, Landroid/graphics/Rect;

    sget-object v2, Ld/b/q/OpticalInsetsApi28_235;->sLeft:Ljava/lang/reflect/Field;

    .line 194
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    sget-object v3, Ld/b/q/OpticalInsetsApi28_235;->sTop:Ljava/lang/reflect/Field;

    .line 195
    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    sget-object v4, Ld/b/q/OpticalInsetsApi28_235;->sRight:Ljava/lang/reflect/Field;

    .line 196
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    sget-object v5, Ld/b/q/OpticalInsetsApi28_235;->sBottom:Ljava/lang/reflect/Field;

    .line 197
    invoke-virtual {v5, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    return-object v1

    .line 192
    .end local v0    # "insets":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 202
    :catch_0
    move-exception v0

    goto :goto_1

    .line 200
    :catch_1
    move-exception v0

    .line 204
    :goto_0
    nop

    .line 206
    :cond_1
    :goto_1
    sget-object v0, Ld/b/q/p;->c:Landroid/graphics/Rect;

    return-object v0
.end method
