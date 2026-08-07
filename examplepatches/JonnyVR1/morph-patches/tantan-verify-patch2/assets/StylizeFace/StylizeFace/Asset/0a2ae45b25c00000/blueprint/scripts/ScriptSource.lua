-- blueprint_event_node.entrance
local code_entity = {}
xe.Director:GetInstance():SetLogEnable(true)
-- delay call
-- this function will be called once when the binding event is ready to work.
function code_entity:onEventEntrance(event, world, variant_data)
    -- add something new here.
    local sender = event:GetSender()
    if sender then 
        local variableNode = XECast(sender, "XEPVariableScriptNode")
        self._variableNode = variableNode
        self._event = event
        local affectNodes = self:getAffectNodes()
        print("variableNode script event ready -", variableNode:GetNodeTitle())
        print("Affect nodes count:", #affectNodes)
        print("=============Start=================")
        self._filter_params = {}
        for i, v in pairs(affectNodes) do
            print(v:GetNodeTitle())
            local filterIns = v:GetCompiledFilterInstance()
            if filterIns then
                print(v:GetNodeTitle())
                local params_vars = {}
                params_vars._face_mt_ins = filterIns:GetMaterialInstance()
                params_vars._mt_param_val = XEVariant()
                params_vars._mt_param_val2 = XEVariant()
                params_vars._mt_param_effectenable_id = params_vars._face_mt_ins:GetParameterIdByParamName("effectEnable")
                params_vars._mt_param_video_seg_tex_id = params_vars._face_mt_ins:GetParameterIdByParamName("EffectMaskTextureSampler")
                params_vars._mt_param_mask_warp_mat_id = params_vars._face_mt_ins:GetParameterIdByParamName("warpMat")
                params_vars._mt_param_mask_size_id = params_vars._face_mt_ins:GetParameterIdByParamName("effectMaskSize")
                params_vars._mt_param_flip_x_id = params_vars._face_mt_ins:GetParameterIdByParamName("flipx")
                table.insert(self._filter_params,  i, params_vars)
            end
        end
        print("=============End=================")
    end
    ---@type XEPatchGraph
    local graph = self._variableNode:GetGraph()
    if null ~= graph then
        ---@type XEPGraphSchema
        local graphSchema = graph:GetSchema()
        if null ~= graphSchema then
            graphSchema:SetOrder(-64)
        end
    end
end

--this script can affect nodes that linked to the script-node
--@type: table, element type:XEPatchGraphNode
function code_entity:getAffectNodes()
    if not self._variableNode then return end
    local nodes = self._variableNode:GetAffectNodes()
    return nodes
end

function code_entity:onEventRelease(event, world, variant_data)
    -- add something new here.
end

-- this function will be called once when the event has been triggered.
function code_entity:onEventTrigger(event, world, variant_data)
    -- add something new here.
end

-- this function will be called once when the event has been restored.
function code_entity:onEventRestore(event, world, variant_data)
    -- add something new here.
end

-- this function will be called each tick.
function code_entity:onEventTick(event, world, interval)
    -- add something new here.
    self:segmentTextureParams()
end

function code_entity:segmentTextureParams()
    --segment texture
    for i = 1, 3 do
        local mutableEntity = XEMagicCore.GetMutableEntity(i)
        local params_vars = self._filter_params[i]
        local bOk = 0
        if mutableEntity and mutableEntity:IsValid() and mutableEntity.texture2DEntity1 then
            local seg_enti = mutableEntity.texture2DEntity1
            local tex2d = seg_enti.texture2D
            if tex2d then
                params_vars._mt_param_val:SetUserData(tex2d)
                XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_video_seg_tex_id, params_vars._mt_param_val)
                params_vars._mt_param_val:SetVECTOR2(XVECTOR2(tex2d:Width(), tex2d:Height()))
                XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_mask_size_id, params_vars._mt_param_val)
                local mat4 = XMATRIX4(seg_enti.mWarpMat._11, seg_enti.mWarpMat._12, seg_enti.mWarpMat._13, 0,
                        seg_enti.mWarpMat._21, seg_enti.mWarpMat._22, seg_enti.mWarpMat._23, 0,
                        seg_enti.mWarpMat._31, seg_enti.mWarpMat._32, seg_enti.mWarpMat._33, 0,
                        0, 0, 0, 1)
                params_vars._mt_param_val2:SetMatrix4(mat4)
                XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_mask_warp_mat_id, params_vars._mt_param_val2)

                if seg_enti.bFlipX then
                    params_vars._mt_param_val:SetFloat(1.0)
                    XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_flip_x_id, params_vars._mt_param_val)
                else
                    params_vars._mt_param_val:SetFloat(0.0)
                    XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_flip_x_id, params_vars._mt_param_val)
                end
                bOk = 1.0
            end
        end
        params_vars._mt_param_val:SetFloat(bOk)
        XEUtility.SetMaterialParamValue(params_vars._face_mt_ins, params_vars._mt_param_effectenable_id, params_vars._mt_param_val)
    end
    
end

-- add other logics as you want here.
-- This script will run once. code_entity will be built.
-- call something other executable here. 
print("こんにちは、じゃ、まだね。")
-- cannot call the cpp side function immediately.
-- the return value should be a table.
return code_entity
